using BE;
using DA;

namespace BL
{
    public class BLUsuarios
    {
        private readonly DAUsuarios _DAUsuarios = new DAUsuarios();
        private readonly DATransacciones _DATransacciones = new DATransacciones();

        public BEUsuarios ValidarUsuario(string correo, string contraseña)
        {
            var datosUsuario = _DAUsuarios.ObtenerUsuario(correo);
            if (datosUsuario == null)
            {
                return null;
            }

            if(contraseña != datosUsuario.contraseña)
            {
                return null;
            }

            return datosUsuario;
        }

        public List<BEUsuarios> ListarUsuarios()
        {
            List<BEUsuarios> lst = _DAUsuarios.ListarUsuarios();
            return lst;
        }

        public BEUsuarios ObtenerUsuarioXID(int id)
        {
            BEUsuarios lst = _DAUsuarios.ObtenerUsuarioXID(id);
            return lst;
        }

        public List<BETransacciones> ObtenerUltimos5Movimientos(int id)
        {
            List<BETransacciones> lst = _DATransacciones.Ultimos5MovimientosXID(id);
            return lst;
        }

        public bool RegistrarUsuarios(BEUsuarios obj)
        {
            bool rpta = true;

            int valor = _DAUsuarios.BuscarUsuario(obj.dni2);
            if(valor == 0)
            {
                _DAUsuarios.RegistrarUsuario(obj);
            }
            else
            {
                rpta = false;
            }
            return rpta;
        }

        public bool ActualizarAjustes(BEUsuarios obj)
        {
            bool rpta = _DAUsuarios.ActualizarAjustes(obj);
            return rpta;
        }

        public bool RegistrarTransaccion(BETransacciones obj)
        {
            if (obj.tipo == 1)
            {
                bool rpta = _DAUsuarios.RegistrarTransaccionIngreso(obj);
                return rpta;
            }

            if (obj.tipo == 2)
            {
                decimal balanceUsuario = _DAUsuarios.MontoXID(obj.id);

                if(balanceUsuario > obj.monto)
                {
                    bool rpta = _DAUsuarios.RegistrarTransaccionRetiro(obj);
                    return rpta;
                }
                else
                {
                    return false;
                }

            }

            return false;
        }
    }
}