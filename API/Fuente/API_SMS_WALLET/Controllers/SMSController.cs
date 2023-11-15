using API_SMS_WALLET.Data;
using API_SMS_WALLET.Logic;
using Microsoft.AspNetCore.Mvc;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Threading;

namespace API_SMS_WALLET.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SMSController : Controller
    {
        private readonly DAMensajeria _DAMensajeria = new DAMensajeria();
        private readonly BLMensajeria _BLMensajeria = new BLMensajeria();

        [HttpPost("Mensaje")]
        public IActionResult UltimoMensaje(APIMensajeria apimensajeria)
        {
            try
            {
                string mensajeEnviar = "";
                //Flujo inicial
                var rpta = _DAMensajeria.UltimoMensajeXEmisor(apimensajeria.emisor);
                if (rpta == null)
                {
                    mensajeEnviar = "Estimado usuario, por favor seleccione la opción que desea:\n1. Registro\n2. Login\n3. Recuperar cuenta";

                    Mensajeria mensajeriaInicial = new Mensajeria();
                    mensajeriaInicial.id_flujo = 0;
                    mensajeriaInicial.body = mensajeEnviar;
                    mensajeriaInicial.emisor = apimensajeria.emisor;
                    mensajeriaInicial.receptor = apimensajeria.receptor;

                    _BLMensajeria.Entrante(apimensajeria, 1);
                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 1);

                    return Json(mensajeEnviar);
                }
                else
                {
                    switch (rpta.id_flujo)
                    {
                        case 1:
                            _BLMensajeria.Entrante(apimensajeria, 2);
                            if (apimensajeria.body == "1" || apimensajeria.body == "2" || apimensajeria.body == "3")
                            {
                                if (apimensajeria.body == "1")
                                {
                                    mensajeEnviar = "Por favor, responda a los siguientes campos para poder registrarlo.";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 3);
                                }
                                else if (apimensajeria.body == "2")
                                {
                                    mensajeEnviar = "Ingrese su DNI:";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 20);
                                }
                                else if (apimensajeria.body == "3")
                                {
                                    mensajeEnviar = "Ingrese su DNI:";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 40);
                                }
                            }
                            else
                            {
                                mensajeEnviar = "Por favor introduzca una opción válida.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 2);
                            }
                            return Json(mensajeEnviar);
                        case 2:
                            _BLMensajeria.Entrante(apimensajeria, 2);
                            if (apimensajeria.body == "1" || apimensajeria.body == "2" || apimensajeria.body == "3")
                            {
                                if (apimensajeria.body == "1")
                                {
                                    mensajeEnviar = "Por favor, responda a los siguientes campos para poder registrarlo.";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 3);
                                }
                                else if (apimensajeria.body == "2")
                                {
                                    mensajeEnviar = "Ingrese su DNI:";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 20);
                                }
                                else if (apimensajeria.body == "3")
                                {
                                    mensajeEnviar = "Ingrese su DNI:";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 40);
                                }
                            }
                            else
                            {
                                mensajeEnviar = "Por favor introduzca una opción válida.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 2);
                            }
                            return Json(mensajeEnviar);
                        case 4:
                            mensajeEnviar = "Fecha de nacimiento DDMMAAAA(01012001):";
                            apimensajeria.body = apimensajeria.body.ToUpper();
                            _BLMensajeria.Entrante(apimensajeria, 4);
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 5);
                            return Json(mensajeEnviar);
                        case 5:
                            mensajeEnviar = "Nombre del padre:";
                            apimensajeria.body = apimensajeria.body.ToUpper();
                            _BLMensajeria.Entrante(apimensajeria, 5);
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 6);
                            return Json(mensajeEnviar);
                        case 6:
                            mensajeEnviar = "Nombre de la madre:";
                            apimensajeria.body = apimensajeria.body.ToUpper();
                            _BLMensajeria.Entrante(apimensajeria, 6);
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 7);
                            return Json(mensajeEnviar);
                        case 7:
                            mensajeEnviar = "Lugar de Nacimiento DEPARTAMENTO*PROVINCIA*DISTRITO (ICA*ICA*ICA). Luego, se validarán sus datos:";
                            apimensajeria.body = apimensajeria.body.ToUpper();
                            _BLMensajeria.Entrante(apimensajeria, 7);
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 8);
                            return Json(mensajeEnviar);
                        case 8:
                            apimensajeria.body = apimensajeria.body.Replace('*', '/');
                            apimensajeria.body = apimensajeria.body.ToUpper();
                            _BLMensajeria.Entrante(apimensajeria, 8);
                            mensajeEnviar = _BLMensajeria.ValidarDatosRENIEC(apimensajeria);
                            if (mensajeEnviar == "Introduzca su contraseña en la llamada.")
                            {
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                            }
                            else
                            {
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                            }
                            return Json(mensajeEnviar);
                        case 10:
                            _BLMensajeria.Entrante(apimensajeria, 8);
                            string codigo = _DAMensajeria.BuscarCodigoXNumero(apimensajeria.emisor);
                            codigo = codigo.ToUpper();
                            apimensajeria.body = codigo.ToUpper();

                            if (codigo == apimensajeria.body)
                            {
                                var datos = _DAMensajeria.BuscarDatosNuevoUsuario(apimensajeria.emisor);

                                var existeUsuario = _DAMensajeria.BuscarUsuario(datos[0]);
                                if (existeUsuario != 0)
                                {
                                    mensajeEnviar = "Ya existe una cuenta registrada con esos datos.";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                    return Json(mensajeEnviar);
                                }

                                //datos[3] = Crypt.Encrypt(datos[3]);
                                var valRegistro = _BLMensajeria.RegistrarUsuario(datos, apimensajeria.emisor);
                                if (valRegistro)
                                {
                                    mensajeEnviar = "Registrado correctamente.";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                    return Json(mensajeEnviar);
                                }
                                else
                                {
                                    mensajeEnviar = "Ocurrió un error.";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 9);
                                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                    return Json(mensajeEnviar);
                                }
                            }
                            else
                            {
                                mensajeEnviar = "El código ingresado no es el correcto.";
                                return Json(mensajeEnviar);
                            }
                        case 20:
                            mensajeEnviar = "Ingrese su contraseña en la llamada.";
                            _BLMensajeria.Entrante(apimensajeria, 20);
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 21);
                            return Json(mensajeEnviar);
                        case 22:
                            _BLMensajeria.Entrante(apimensajeria, 22);
                            if (apimensajeria.body == "1" || apimensajeria.body == "2")
                            {
                                if (apimensajeria.body == "1")
                                {
                                    mensajeEnviar = "Ingrese el número de celular al que desea transferir.";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 24);
                                }
                                else if (apimensajeria.body == "2")
                                {
                                    var datosCuenta = _DAMensajeria.ObtenerUsuarioXCelular(apimensajeria.emisor);
                                    mensajeEnviar = "Balance general: " + datosCuenta.balance;

                                    var transaccionesCuenta = _DAMensajeria.Ultimos3Movimientos(datosCuenta.id);
                                    foreach (var item in transaccionesCuenta)
                                    {
                                        mensajeEnviar += "/n " + item.monto + " -> " + item.texttipoTransaccion;
                                    }

                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 28);
                                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                }
                            }
                            else
                            {
                                mensajeEnviar = "Por favor introduzca una opción válida.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 22);
                            }
                            return Json(mensajeEnviar);
                        case 23:
                            _BLMensajeria.Entrante(apimensajeria, 23);
                            if (apimensajeria.body == "1" || apimensajeria.body == "2" || apimensajeria.body == "3")
                            {
                                if (apimensajeria.body == "1")
                                {
                                    mensajeEnviar = "Ingrese el número de celular al que desea transferir:";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 24);
                                }
                                else if (apimensajeria.body == "2")
                                {
                                    var datosCuenta = _DAMensajeria.ObtenerUsuarioXCelular(apimensajeria.emisor);
                                    mensajeEnviar = "Balance general: " + datosCuenta.balance;

                                    var transaccionesCuenta = _DAMensajeria.Ultimos3Movimientos(datosCuenta.id);
                                    foreach (var item in transaccionesCuenta)
                                    {
                                        mensajeEnviar += "/n " + item.monto + " -> " + item.texttipoTransaccion;
                                    }

                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 28);
                                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                }
                            }
                            else
                            {
                                mensajeEnviar = "Por favor introduzca una opción válida.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 13);
                            }
                            return Json(mensajeEnviar);
                        case 24:
                            mensajeEnviar = "Monto a enviar:";
                            _BLMensajeria.Entrante(apimensajeria, 24);
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 25);
                            return Json(mensajeEnviar);
                        case 25:
                            _BLMensajeria.Entrante(apimensajeria, 25);
                            var datosATransferir = _DAMensajeria.BuscarDatosMontoATransferir(apimensajeria.emisor);
                            var datosDeLaCuentaPrincipal = _DAMensajeria.ObtenerUsuarioXCelular(apimensajeria.emisor);
                            var datosDeLaCuentaSecundaria = _DAMensajeria.ObtenerUsuarioXCelular(datosATransferir[0]);

                            CultureInfo cultura = new CultureInfo("en-US");
                            decimal balanceCuentaPrincipal = decimal.Parse(datosATransferir[1], cultura);
                            decimal transferenciaAEfectuar = decimal.Parse(apimensajeria.body, cultura);

                            if (datosDeLaCuentaPrincipal != null)
                            {
                                if (datosDeLaCuentaPrincipal.balance >= balanceCuentaPrincipal)
                                {
                                    mensajeEnviar = "Transferencia realizada correctamente.";
                                    _DAMensajeria.RegistrarTransaccionTransferenciaEnviada(datosDeLaCuentaPrincipal.id, 3, transferenciaAEfectuar);
                                    _DAMensajeria.RegistrarTransaccionTransferenciaRecibida(datosDeLaCuentaSecundaria.id, 4, transferenciaAEfectuar);
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 26);
                                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                }
                                else
                                {
                                    mensajeEnviar = "El monto ingresado es mayor al saldo de su cuenta.";
                                    _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 26);
                                    _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                                }
                            }
                            else
                            {
                                mensajeEnviar = "La cuenta a transferir no se encuentra registrada.";
                                _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 26);
                                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                            }
                            return Json(mensajeEnviar);
                        case 40:
                            mensajeEnviar = "Ingrese su contraseña antigua en la llamada.";
                            _BLMensajeria.Entrante(apimensajeria, 40);
                            _BLMensajeria.Salida(apimensajeria, mensajeEnviar, 41);
                            return Json(mensajeEnviar);
                        default:
                            mensajeEnviar = "Ocurrió un error.";
                            return Json(mensajeEnviar);
                    }
                }
            }
            catch(Exception ex)
            {
                _DAMensajeria.CerrarFlujo(apimensajeria.emisor);
                return Json("Ocurrió un error.");
            } 
        }

        [HttpPost("FlujoAdicional")]
        public IActionResult ObtenerFlujo(APIFlujoSaliente apiflujosaliente)
        {
            string mensajeEnviar = "";
            APIMensajeria obj = new APIMensajeria();

            try
            {
                switch (apiflujosaliente.idFlujo)
                {
                    case 4:
                        mensajeEnviar = "DNI:";
                        obj.emisor = apiflujosaliente.receptor;
                        obj.receptor = apiflujosaliente.emisor;
                        obj.body = "DNI";
                        _BLMensajeria.Salida(obj, mensajeEnviar, 4);
                        return Json("DNI:");
                    case 9:
                        obj.emisor = apiflujosaliente.receptor;
                        obj.receptor = apiflujosaliente.emisor;

                        _DAMensajeria.GenerarCodigo(obj.emisor);
                        string codigo = _DAMensajeria.BuscarCodigoXNumero(obj.emisor);
                        _BLMensajeria.EnviarCodigo(obj.emisor, codigo);

                        mensajeEnviar = "Introduzca el codigo de seguridad enviado:";
                        obj.body = mensajeEnviar;
                        _BLMensajeria.SalidaAUX(obj, mensajeEnviar, 10);
                        return Json(mensajeEnviar);
                    case 21:
                        obj.emisor = apiflujosaliente.receptor;
                        obj.receptor = apiflujosaliente.emisor;
                        var lst = _DAMensajeria.BuscarDatosValidarUsuario(obj.emisor);
                        var validar = _DAMensajeria.ValidarUsuario(lst[0], lst[1]);
                        if (validar != 0)
                        {
                            mensajeEnviar = "Seleccione la operación que desea hacer:/n 1.Transferir dinero /n 2.Estado de la cuenta";
                            _BLMensajeria.Salida(obj, mensajeEnviar, 22);
                            return Json(mensajeEnviar);
                        }
                        else
                        {
                            mensajeEnviar = "Error al validar las credenciales";
                            _BLMensajeria.Salida(obj, mensajeEnviar, 22);
                            _DAMensajeria.CerrarFlujo(obj.emisor);
                            return Json(mensajeEnviar);
                        }
                    case 41:
                        mensajeEnviar = "Ingrese su nueva contraseña en la llamada.";
                        obj.emisor = apiflujosaliente.receptor;
                        obj.receptor = apiflujosaliente.emisor;
                        _BLMensajeria.SalidaAUX(obj, mensajeEnviar, 42);
                        return Json(mensajeEnviar);
                    case 42:
                        obj.emisor = apiflujosaliente.receptor;
                        obj.receptor = apiflujosaliente.emisor;
                        var lst2 = _DAMensajeria.BuscarDatosValidarUsuario2(obj.emisor);
                        var validar2 = _DAMensajeria.ValidarUsuario(lst2[0], lst2[1]);

                        if (validar2 != 0)
                        {
                            var rpta2 = _DAMensajeria.ActualizarContraseña(obj.emisor);
                            if (rpta2)
                            {
                                mensajeEnviar = "Contraseña actualizada correctamente.";
                            }
                            else
                            {
                                mensajeEnviar = "Ocurrió un error.";
                            }
                        }
                        else
                        {
                            mensajeEnviar = "Contraseña incorrecta.";
                        }
                        obj.emisor = apiflujosaliente.receptor;
                        obj.receptor = apiflujosaliente.emisor;
                        _BLMensajeria.SalidaAUX(obj, mensajeEnviar, 43);
                        _DAMensajeria.CerrarFlujo(obj.emisor);
                        return Json(mensajeEnviar);
                    default:
                        mensajeEnviar = "Ocurrió un error.";
                        return Json(mensajeEnviar);
                }
            }
            catch (Exception ex)
            {
                obj.emisor = apiflujosaliente.receptor;
                _DAMensajeria.CerrarFlujo(obj.emisor);
                mensajeEnviar = "Ocurrió un error.";
                return Json(mensajeEnviar);
            } 
        }
    }
}
