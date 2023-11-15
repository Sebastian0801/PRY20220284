using System.Data.SqlClient;
using System.Data;
using BE;

namespace DA
{
    public class DAUsuarios
    {
        public BEUsuarios ObtenerUsuario(string correo)
        {
            BEUsuarios dato = new BEUsuarios();
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Buscar_UsuarioXCORREO", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@correo", correo);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dato = new BEUsuarios()
                    {
                        id = dr.GetInt32(0),
                        DNI = dr.GetString(1),
                        nombres = dr.GetString(2),
                        apellidos = dr.GetString(3),
                        celular=dr.GetString(4),
                        contraseña=dr.GetString(5),
                        tipo=dr.GetInt32(6),
                        estado=dr.GetInt32(7),
                        fechaCreacion=dr.GetDateTime(8),
                        correo=dr.GetString(9)
                    };
                }
                dr.Close();
                con.Close();
            }
            return dato;
        }

        public List<BESolicitud> ListarSolicitudXID(int id)
        {
            BESolicitud dato = new BESolicitud();
            List<BESolicitud> datos = new List<BESolicitud>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Listar_SolicitudXID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new BESolicitud()
                    {
                        id = dr.GetInt32(0),
                        monto=dr.GetDecimal(1),
                        idUsuario=dr.GetInt32(2),
                        estado=dr.GetInt32(3),
                        fechaCreacion=dr.GetDateTime(4)
                    };

                    //estado
                    if (dato.estado == 1)
                    {
                        dato.txtEstado = "Pendiente";
                    }
                    else if (dato.estado == 2)
                    {
                        dato.txtEstado = "Procesando";
                    }
                    else if (dato.estado == 3)
                    {
                        dato.txtEstado = "Correcto";
                    }
                    else if (dato.estado == 4)
                    {
                        dato.txtEstado = "Error";
                    }

                    dato.txtFechaCreacion = dato.fechaCreacion.ToString("dd/MM/yyyy HH:mm:ss");
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public List<BEUsuarios> ListarUsuarios()
        {
            BEUsuarios dato = new BEUsuarios();
            List<BEUsuarios> datos = new List<BEUsuarios>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Listar_Usuarios", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new BEUsuarios()
                    {
                        id = dr.GetInt32(0),
                        DNI = dr.GetString(1),
                        nombres = dr.GetString(2),
                        apellidos = dr.GetString(3),
                        celular = dr.GetString(4),
                        contraseña = dr.GetString(5),
                        tipo = dr.GetInt32(6),
                        estado = dr.GetInt32(7),
                        fechaCreacion = dr.GetDateTime(8),
                        correo = dr.GetString(9),
                        balance=dr.GetDecimal(10),
                        tipoTransaccion=dr.GetInt32(11),
                        monto=dr.GetDecimal(12),
                        fechaUltimaTransaccion=dr.GetDateTime(13)
                    };

                    //estado
                    if (dato.estado == 1)
                    {
                        dato.textestado = "Activo";
                    }
                    else
                    {
                        dato.textestado = "Inactivo";
                    }

                    //tipoTransaccion
                    if (dato.tipoTransaccion == 1)
                    {
                        dato.texttipoTransaccion = "Ingreso";
                    }
                    else if (dato.tipoTransaccion == 2)
                    {
                        dato.texttipoTransaccion = "Retiro";
                    }
                    else if (dato.tipoTransaccion == 3)
                    {
                        dato.texttipoTransaccion = "Transferencia Emitida"; 
                    }
                    else if (dato.tipoTransaccion == 4)
                    {
                        dato.texttipoTransaccion = "Transferencia Recibida";
                    }

                    dato.textidentificacion = dato.nombres + " " + dato.apellidos;
                    dato.txtfechaUltimaTransaccion = dato.fechaUltimaTransaccion.ToString("dd/MM/yyyy HH:mm:ss");
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public BEUsuarios ObtenerUsuarioXID(int id)
        {
            BEUsuarios dato = new BEUsuarios();
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Buscar_UsuarioXID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dato = new BEUsuarios()
                    {
                        id = dr.GetInt32(0),
                        DNI = dr.GetString(1),
                        nombres = dr.GetString(2),
                        apellidos = dr.GetString(3),
                        celular = dr.GetString(4),
                        contraseña = dr.GetString(5),
                        tipo = dr.GetInt32(6),
                        estado = dr.GetInt32(7),
                        fechaCreacion = dr.GetDateTime(8),
                        correo = dr.GetString(9)
                    };
                }
                dr.Close();
                con.Close();
            }
            return dato;
        }

        public decimal TotalEmitido()
        {
            decimal total = 0;
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Contar_Emitido_Monto", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    total=dr.GetDecimal(0);
                }
                dr.Close();
                con.Close();
            }
            return total;
        }

        public decimal TotalRecibido()
        {
            decimal total = 0;
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Contar_Recibido_Monto", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    total = dr.GetDecimal(0);
                }
                dr.Close();
                con.Close();
            }
            return total;
        }

        public int BuscarUsuario(string dni)
        {
            int valor = 0;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_UsuarioXDNI", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dni", dni);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    valor = dr.GetInt32(0);
                }
                dr.Close();
                con.Close();
            }

            return valor;
        }

        public bool RegistrarUsuario(BEUsuarios obj)
        {
            bool rpta = true;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Usuario2", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@dni", obj.dni2);
                    cmd.Parameters.AddWithValue("@nombres", obj.nombres);
                    cmd.Parameters.AddWithValue("@apellidos", obj.apellidos);
                    cmd.Parameters.AddWithValue("@celular", obj.celular);
                    cmd.Parameters.AddWithValue("@contraseña", obj.contraseña);
                    cmd.Parameters.AddWithValue("@correo", obj.correo);
                    cmd.Parameters.AddWithValue("@tipo", obj.tipo);

                    con.Open();
                    cmd.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    rpta = false;
                }
                finally
                {
                    con.Close();
                }

                return rpta;
            }
        }

        public bool RegistrarSolicitud(int id,decimal monto, int tipo)
        {
            bool rpta = true;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Solicitud", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@monto", monto);
                    cmd.Parameters.AddWithValue("@tipo", tipo);

                    con.Open();
                    cmd.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    rpta = false;
                }
                finally
                {
                    con.Close();
                }

                return rpta;
            }
        }

        public int RespuestaValidacion(int id, decimal monto)
        {
            int total = 0;
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Buscar_RespuestaValidacion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@monto", monto);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    total = dr.GetInt32(0);
                }
                dr.Close();
                con.Close();
            }
            return total;
        }

        public int ValidarMetodoRecarga()
        {
            int total = 0;
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_ValidarRecarga_Solicitud", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    total = dr.GetInt32(0);
                }
                dr.Close();
                con.Close();
            }
            return total;
        }

        public int TotalTransacciones()
        {
            int total = 0;
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Contar_Transacciones", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    total = dr.GetInt32(0);
                }
                dr.Close();
                con.Close();
            }
            return total;
        }

        public int TotalUsuarios()
        {
            int total = 0;
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Contar_UsuariosActivos", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    total = dr.GetInt32(0);
                }
                dr.Close();
                con.Close();
            }
            return total;
        }

        public List<BEUsuarios> ListarUltimos5Usuarios()
        {
            BEUsuarios dato = new BEUsuarios();
            List<BEUsuarios> datos = new List<BEUsuarios>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Contar_Ultimas5CuentasCreadas", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new BEUsuarios()
                    {
                        id = dr.GetInt32(0),
                        DNI = dr.GetString(1),
                        nombres = dr.GetString(2),
                        apellidos = dr.GetString(3),
                        celular = dr.GetString(4),
                        contraseña = dr.GetString(5),
                        tipo = dr.GetInt32(6),
                        estado = dr.GetInt32(7),
                        fechaCreacion = dr.GetDateTime(8)
                    };

                    dato.textidentificacion = dato.nombres + " " + dato.apellidos;

                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public bool ActualizarAjustes(BEUsuarios obj)
        {
            bool rpta;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Actualizar_Usuario", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", obj.id);
                    cmd.Parameters.AddWithValue("@dni", obj.DNI);
                    cmd.Parameters.AddWithValue("@nombres", obj.nombres);
                    cmd.Parameters.AddWithValue("@apellidos", obj.apellidos);
                    cmd.Parameters.AddWithValue("@celular", obj.celular);
                    cmd.Parameters.AddWithValue("@contraseña", obj.contraseña);
                    cmd.Parameters.AddWithValue("@correo", obj.correo);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    rpta = true;

                }
                catch (Exception ex)
                {
                    rpta = false;
                }
                finally
                {
                    con.Close();
                }
                return rpta;
            }
        }

        public bool ActualizarDatos(int id, string DNI, string nombres, string apellidos, string celular, int estado)
        {
            bool rpta;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Actualizar_Usuario_Billetera", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@dni", DNI);
                    cmd.Parameters.AddWithValue("@nombres", nombres);
                    cmd.Parameters.AddWithValue("@apellidos", apellidos);
                    cmd.Parameters.AddWithValue("@celular", celular);
                    cmd.Parameters.AddWithValue("@estado", estado);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    rpta = true;

                }
                catch (Exception ex)
                {
                    rpta = false;
                }
                finally
                {
                    con.Close();
                }
                return rpta;
            }
        }

        public bool RegistrarTransaccionIngreso(BETransacciones obj)
        {
            bool rpta;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Transaccion_Ingreso", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", obj.id);
                    cmd.Parameters.AddWithValue("@tipo", obj.tipo);
                    cmd.Parameters.AddWithValue("@monto", obj.monto);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    rpta = true;

                }
                catch (Exception ex)
                {
                    rpta = false;
                }
                finally
                {
                    con.Close();
                }
                return rpta;
            }
        }

        public bool RegistrarTransaccionRetiro(BETransacciones obj)
        {
            bool rpta;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Transaccion_Retiro", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", obj.id);
                    cmd.Parameters.AddWithValue("@tipo", obj.tipo);
                    cmd.Parameters.AddWithValue("@monto", obj.monto);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    rpta = true;

                }
                catch (Exception ex)
                {
                    rpta = false;
                }
                finally
                {
                    con.Close();
                }
                return rpta;
            }
        }

        public decimal MontoXID(int id)
        {
            decimal total = 0;
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Buscar_MontoXID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    total = dr.GetDecimal(0);
                }
                dr.Close();
                con.Close();
            }
            return total;
        }
    }
}