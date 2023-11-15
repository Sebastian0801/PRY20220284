using System.Data;
using System.Data.SqlClient;
using System.Threading;

namespace API_SMS_WALLET.Data
{
    public class DAMensajeria
    {
        public Mensajeria UltimoMensajeXEmisor(string emisor)
        {
            Mensajeria mensajeria = null;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Ultimo_Mensaje_X_EMISOR", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", emisor);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    mensajeria = new Mensajeria()
                    {
                        id = dr.GetInt32(0),
                        emisor = dr.GetString(1),
                        receptor = dr.GetString(2),
                        body = dr.GetString(3),
                        id_flujo = dr.GetInt32(4),
                        fechaCreacion = dr.GetDateTime(5)
                    };
                }
                dr.Close();
                con.Close();
            }

            return mensajeria;
        }

        public Mensajeria UltimoMensajeXEmisorAUX(string emisor)
        {
            Mensajeria mensajeria = null;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Ultimo_Mensaje_X_EMISOR_aux", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", emisor);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    mensajeria = new Mensajeria()
                    {
                        id = dr.GetInt32(0),
                        emisor = dr.GetString(1),
                        receptor = dr.GetString(2),
                        body = dr.GetString(3),
                        id_flujo = dr.GetInt32(4),
                        fechaCreacion = dr.GetDateTime(5)
                    };
                }
                dr.Close();
                con.Close();
            }

            return mensajeria;
        }

        public Flujos ObtenerMensajeXFlujo(string emisor)
        {
            Flujos flujos = null;

            var ultimoMensaje = UltimoMensajeXEmisor(emisor);
            if(ultimoMensaje==null)
            {
                ultimoMensaje = UltimoMensajeXEmisorAUX(emisor);
            }

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Siguiente_Flujo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", ultimoMensaje.id_flujo);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    flujos = new Flujos()
                    {
                        id = dr.GetInt32(0),
                        id_HeaderFlujo = dr.GetInt32(1),
                        orden = dr.GetInt32(2),
                        mensaje = dr.GetString(3)
                    };
                }
                dr.Close();
                con.Close();
            }

            return flujos;
        }

        public Flujos ObtenerFlujoXID(int id)
        {
            Flujos flujos = null;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_FlujoXID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    flujos = new Flujos()
                    {
                        id = dr.GetInt32(0),
                        id_HeaderFlujo = dr.GetInt32(1),
                        orden = dr.GetInt32(2),
                        mensaje = dr.GetString(3)
                    };
                }
                dr.Close();
                con.Close();
            }

            return flujos;
        }

        public bool RegistrarMensajeria(Mensajeria mensajeria)
        {
            bool rpta = true;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Mensaje", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@emisor", mensajeria.emisor);
                    cmd.Parameters.AddWithValue("@receptor", mensajeria.receptor);
                    cmd.Parameters.AddWithValue("@body", mensajeria.body);
                    cmd.Parameters.AddWithValue("@id_flujo", mensajeria.id_flujo);
                    cmd.Parameters.AddWithValue("@numeroContacto", mensajeria.numeroContacto);
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

        public bool GenerarCodigo(string numero)
        {
            bool rpta = true;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Generar_Codigo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@numero", numero);

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

        public string BuscarCodigoXNumero(string numero)
        {
            string codigo = "";
            int aux=0;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_CodigoXEmisor", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", numero);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    aux = dr.GetInt32(0);
                }
                dr.Close();
                con.Close();
            }

            return Convert.ToString(aux);
        }

        public List<string> BuscarDatosValidaciónRENIEC(string numero)
        {
            string dato = "";
            List<string> datos = new List<string>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Validacion_RENIEC", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", numero);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = dr.GetString(0);
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public List<string> BuscarDatosNuevoUsuario(string numero)
        {
            string dato = "";
            List<string> datos = new List<string>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Nuevo_Usuario", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", numero);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = dr.GetString(0);
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public List<string> BuscarDatosMontoATransferir(string numero)
        {
            string dato = "";
            List<string> datos = new List<string>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Monto_Transferir", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", numero);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = dr.GetString(0);
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public APIUsuarios ObtenerUsuarioXCelular(string celular)
        {
            APIUsuarios dato = new APIUsuarios();
            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Buscar_UsuarioXCelular", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@celular", celular);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dato = new APIUsuarios()
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
                        correo=dr.GetString(9),
                        balance=dr.GetDecimal(10)
                    };
                }
                dr.Close();
                con.Close();
            }
            return dato;
        }

        public bool RegistrarUsuario(List<string> datos,string numero)
        {
            bool rpta = true;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Usuario", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@dni", datos[0]);
                    cmd.Parameters.AddWithValue("@nombres", datos[1]);
                    cmd.Parameters.AddWithValue("@apellidos", datos[2]);
                    cmd.Parameters.AddWithValue("@celular", numero);
                    cmd.Parameters.AddWithValue("@contraseña", datos[5]);
                    cmd.Parameters.AddWithValue("@tipo", 1);

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

        public bool CerrarFlujo(string numero)
        {
            bool rpta = true;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Cerrar_Flujo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@numero", numero);

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

        public int ValidarUsuario(string dni, string contraseña)
        {
            int valor = 0;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Validar_UsuarioXSMS", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dni", dni);
                cmd.Parameters.AddWithValue("@contraseña", contraseña);

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

        public List<string> BuscarDatosValidarUsuario(string numero)
        {
            string dato = "";
            List<string> datos = new List<string>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Validar_Usuario", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", numero);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = dr.GetString(0);
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public bool ActualizarContraseña(string numero)
        {
            bool rpta = false;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Actualizar_Contrasenia", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@emisor", numero);

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

        public List<string> BuscarDatosValidarUsuario2(string numero)
        {
            string dato = "";
            List<string> datos = new List<string>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Validar_Usuario2", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@emisor", numero);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = dr.GetString(0);
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }

        public bool RegistrarTransaccionTransferenciaEnviada(int id_usuario,int tipo, decimal monto)
        {
            bool rpta;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Transaccion_Transferencia_Enviada", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id_usuario);
                    cmd.Parameters.AddWithValue("@tipo", tipo);
                    cmd.Parameters.AddWithValue("@monto", monto);

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

        public bool RegistrarTransaccionTransferenciaRecibida(int id_usuario, int tipo, decimal monto)
        {
            bool rpta;

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SP_Registrar_Transaccion_Transferencia_Recibida", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id_usuario);
                    cmd.Parameters.AddWithValue("@tipo", tipo);
                    cmd.Parameters.AddWithValue("@monto", monto);

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

        public List<APITransacciones> Ultimos3Movimientos(int id)
        {
            APITransacciones dato = new APITransacciones();
            List<APITransacciones> datos = new List<APITransacciones>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Ultimas3TransaccionesXID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new APITransacciones()
                    {
                        id = dr.GetInt32(0),
                        id_usuario = dr.GetInt32(1),
                        tipo = dr.GetInt32(2),
                        monto = dr.GetDecimal(3),
                        fechaCreacion = dr.GetDateTime(4)
                    };

                    //tipoTransaccion
                    if (dato.tipo == 1)
                    {
                        dato.texttipoTransaccion = "Ingreso";
                    }
                    else if (dato.tipo == 2)
                    {
                        dato.texttipoTransaccion = "Retiro";
                    }
                    else if (dato.tipo == 3)
                    {
                        dato.texttipoTransaccion = "Transferencia Emitida";
                    }
                    else if (dato.tipo == 4)
                    {
                        dato.texttipoTransaccion = "Transferencia Recibida";
                    }

                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }
    }
}
