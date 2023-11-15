using BL;
using DA;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using OfficeOpenXml;
using OfficeOpenXml.Table;
using System.Data;
using System.Globalization;
using System.Threading;

namespace Wallet_Administrador.Controllers
{
    public class PanelController : Controller
    {
        private readonly BLUsuarios _BLUsuarios = new BLUsuarios();
        private readonly DAUsuarios _DAUsuarios = new DAUsuarios();
        private readonly DATransacciones _DATransacciones = new DATransacciones();
        private readonly BLDashboard _BLDashboard = new BLDashboard();
        private readonly BLBalance _BLBalance = new BLBalance();

        #region Dashboard
        [Authorize(Roles = "Administrador,Super Administrador")]
        public IActionResult Dashboard()
        {
            var totalUsuarios= _DAUsuarios.TotalUsuarios();
            ViewBag.totalUsuarios = totalUsuarios;

            var totalTransacciones= _DAUsuarios.TotalTransacciones();
            ViewBag.totalTransacciones = totalTransacciones+32;

            var totalRecibido= _DAUsuarios.TotalRecibido();
            ViewBag.totalRecibido = totalRecibido;

            var totalEmitido= _DAUsuarios.TotalEmitido();
            ViewBag.totalEmitido = totalEmitido;

            var top5cuentascreadas = _DAUsuarios.ListarUltimos5Usuarios();
            ViewBag.top5cuentascreadas = top5cuentascreadas;

            var top5movimientosrealizados = _DATransacciones.Ultimos5Movimientos();
            ViewBag.top5movimientosrealizados = top5movimientosrealizados;

            var datosDashboard = _BLDashboard.ListarDatosDashboard();
            ViewBag.datosDashboard = datosDashboard;

            return View();
        }
        #endregion

        #region USUARIO
        [Authorize(Roles = "Administrador,Super Administrador")]
        public IActionResult Usuarios()
        {
            return View();
        }

        public JsonResult ListarUsuarios()
        {
            var lstUsuarios = _BLUsuarios.ListarUsuarios();
            return Json(new { data = lstUsuarios });
        }

        public JsonResult registrarUsuario(BE.BEUsuarios usuarios)
        {
            usuarios.contraseña = Crypt.Encrypt(usuarios.contraseña);
            bool rpta=_BLUsuarios.RegistrarUsuarios(usuarios);
            return Json(rpta);
        }

        [Authorize(Roles = "Administrador,Super Administrador")]
        public IActionResult UsuarioDetalle(int id)
        {
            var UsuarioXID = _BLUsuarios.ObtenerUsuarioXID(id);
            ViewBag.UsuarioXID = UsuarioXID;

            var lstUltimos5movimientos = _BLUsuarios.ObtenerUltimos5Movimientos(id);
            ViewBag.lstUltimos5movimientos = lstUltimos5movimientos;

            return View();
        }

        #endregion

        #region Reportes
        [Authorize(Roles = "Administrador,Super Administrador")]
        public IActionResult Reportes()
        {
            return View();
        }

        public JsonResult ListarTransacciones()
        {
            var lst = _DATransacciones.ListarTransacciones();
            return Json(new { data = lst });
        }

        public JsonResult ListarBalance()
        {
            var lst = _BLBalance.ListarBalance();
            return Json(new { data = lst });
        }

        public FileResult CreateExcelTransacciones()
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (var package = new ExcelPackage())
            {
                var data = _DATransacciones.ListarTransacciones();
                string sheetName = "Reporte Transacciones";
                // Agregar una hoja al archivo Excel
                var worksheet = package.Workbook.Worksheets.Add(sheetName);

                // Encabezados
                worksheet.Cells[1, 1].Value = "ID";
                worksheet.Cells[1, 2].Value = "USUARIO";
                worksheet.Cells[1, 3].Value = "TIPO";
                worksheet.Cells[1, 4].Value = "NOMBRE COMPLETO";
                worksheet.Cells[1, 5].Value = "FECHA CREACIÓN";

                // Datos
                for (int row = 0; row < data.Count; row++)
                {
                    worksheet.Cells[row + 2, 1].Value = data[row].id;
                    worksheet.Cells[row + 2, 2].Value = data[row].nombreUsuario;
                    worksheet.Cells[row + 2, 3].Value = data[row].descripcionTipo;
                    worksheet.Cells[row + 2, 4].Value = data[row].NombreCompleto;
                    worksheet.Cells[row + 2, 5].Value = data[row].txtFechaCreacion;
                }

                var startCell = worksheet.Cells[1, 1];
                var table = worksheet.Tables.Add(startCell, "Tabla");

                // Set table name (ensure it's unique)
                table.Name = "Tabla";

                // Definir el estilo de tabla
                table.TableStyle = TableStyles.Light1;

                // Guardar el archivo Excel en un MemoryStream
                var stream = new MemoryStream(package.GetAsByteArray());

                // Crear el FileResult
                return new FileStreamResult(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
                {
                    FileDownloadName = $"reporte_transacciones_{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx"
                };
            }
        }

        public FileResult CreateExcelBalance()
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (var package = new ExcelPackage())
            {
                var data = _BLBalance.ListarBalance();
                string sheetName = "Reporte Balance";
                // Agregar una hoja al archivo Excel
                var worksheet = package.Workbook.Worksheets.Add(sheetName);

                // Encabezados
                worksheet.Cells[1, 1].Value = "ID";
                worksheet.Cells[1, 2].Value = "USUARIO";
                worksheet.Cells[1, 3].Value = "BALANCE SOLES";

                // Datos
                for (int row = 0; row < data.Count; row++)
                {
                    worksheet.Cells[row + 2, 1].Value = data[row].id;
                    worksheet.Cells[row + 2, 2].Value = data[row].txtNombre;
                    worksheet.Cells[row + 2, 3].Value = data[row].txtBalance;
                }

                var startCell = worksheet.Cells[1, 1];
                var table = worksheet.Tables.Add(startCell, "Tabla");

                // Set table name (ensure it's unique)
                table.Name = "Tabla";

                // Definir el estilo de tabla
                table.TableStyle = TableStyles.Light1;

                // Guardar el archivo Excel en un MemoryStream
                var stream = new MemoryStream(package.GetAsByteArray());

                // Crear el FileResult
                return new FileStreamResult(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
                {
                    FileDownloadName = $"reporte_balance_{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx"
                };
            }
        }
        #endregion

        #region Ajustes
        [Authorize(Roles = "Administrador,Super Administrador")]
        public IActionResult Ajustes()
        {
            int? id = HttpContext.Session.GetInt32("idUsuario");

            var UsuarioXID = _BLUsuarios.ObtenerUsuarioXID(Convert.ToInt32(id));
            UsuarioXID.textcontraseña = Crypt.Decrypt(UsuarioXID.contraseña);
            ViewBag.UsuarioXID = UsuarioXID;

            return View();
        }

        public JsonResult ActualizarAjustes(string dni, string nombres, string apellidos, string correo, string contraseña, string celular)
        {
            int? id = HttpContext.Session.GetInt32("idUsuario");

            BE.BEUsuarios obj = new BE.BEUsuarios();
            obj.id = Convert.ToInt32(id);
            obj.DNI = dni;
            obj.nombres = nombres;
            obj.apellidos = apellidos;
            obj.correo = correo;
            obj.contraseña = Crypt.Encrypt(contraseña);
            obj.celular = celular;

            bool rpta = _BLUsuarios.ActualizarAjustes(obj);
            return Json(rpta);
        }

        public JsonResult RealizarTransaccion(int id, int trans, string monto)
        {
            BE.BETransacciones obj = new BE.BETransacciones();
            obj.id = Convert.ToInt32(id);
            CultureInfo cultura = new CultureInfo("en-US");
            obj.monto = decimal.Parse(monto,cultura);
            obj.tipo = trans;

            bool rpta = _BLUsuarios.RegistrarTransaccion(obj);
            return Json(rpta);
        }

        public JsonResult ActualizarDatos(int id, string DNI, string nombres, string apellidos, string celular, int estado)
        {
            bool rpta = _DAUsuarios.ActualizarDatos(id,DNI,nombres,apellidos,celular,estado);
            return Json(rpta);
        }

        #endregion

        #region Recargar
        [Authorize(Roles = "Administrador,Super Administrador")]
        public IActionResult Recargar()
        {
            return View();
        }

        public JsonResult ValidarMetodoRecarga()
        {
            var valor = _DAUsuarios.ValidarMetodoRecarga();
            return Json(valor);
        }

        public JsonResult ValidarYapeRecarga(string montoYape)
        {
            bool rpta = false;
            decimal monto;
            int? id = HttpContext.Session.GetInt32("idUsuario");

            CultureInfo cultura = new CultureInfo("en-US");
            monto = decimal.Parse(montoYape, cultura);


            rpta = _DAUsuarios.RegistrarSolicitud(Convert.ToInt32(id), monto,1);
            //if (rpta)
            //{
            //    do
            //    {
            //        respuestaValidacion = _DAUsuarios.RespuestaValidacion(Convert.ToInt32(id), monto);
            //    } while (respuestaValidacion < 3);
            //}

            return Json(rpta);
        }

        public JsonResult ValidarYapeRetiro(string montoYape)
        {
            bool rpta = false;
            decimal balanceCuenta;
            decimal montoARetirar;
            int? id = HttpContext.Session.GetInt32("idUsuario");

            balanceCuenta = _DAUsuarios.MontoXID(Convert.ToInt32(id));
            CultureInfo cultura = new CultureInfo("en-US");
            //balanceCuenta = decimal.Parse(balanceCuenta, cultura);
            montoARetirar = decimal.Parse(montoYape, cultura);

            if (montoARetirar <= balanceCuenta)
            {
                rpta = _DAUsuarios.RegistrarSolicitud(Convert.ToInt32(id), montoARetirar, 2);
            }
            return Json(rpta);
        }

        public JsonResult ListarSolicitudXID()
        {
            int? id = HttpContext.Session.GetInt32("idUsuario");
            var lstSolicitud = _DAUsuarios.ListarSolicitudXID(Convert.ToInt32(id));
            return Json(new { data = lstSolicitud });
        }
        #endregion

        #region Retirar
        [Authorize(Roles = "Administrador,Super Administrador")]
        public IActionResult Retirar()
        {
            return View();
        }
        #endregion
    }
}
