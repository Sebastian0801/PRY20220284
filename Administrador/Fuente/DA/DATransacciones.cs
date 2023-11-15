using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DA
{
	public class DATransacciones
	{
        public List<BETransacciones> Ultimos5MovimientosXID(int id)
        {
            BETransacciones dato = new BETransacciones();
            List<BETransacciones> datos = new List<BETransacciones>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Ultimas5TransaccionesXID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new BETransacciones()
                    {
                        id = dr.GetInt32(0),
                        id_usuario = dr.GetInt32(1),
                        tipo = dr.GetInt32(2),
                        monto = dr.GetDecimal(3),
                        fechaCreacion=dr.GetDateTime(4)
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

        public List<BETransacciones> Ultimos5Movimientos()
        {
            BETransacciones dato = new BETransacciones();
            List<BETransacciones> datos = new List<BETransacciones>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Contar_Ultimas5MovimientosRealizados", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new BETransacciones()
                    {
                        id = dr.GetInt32(0),
                        id_usuario = dr.GetInt32(1),
                        tipo = dr.GetInt32(2),
                        monto = dr.GetDecimal(3),
                        fechaCreacion = dr.GetDateTime(4),
                        nombreUsuario=dr.GetString(5)
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

        public List<BETransacciones> ListarTransacciones()
        {
            BETransacciones dato = new BETransacciones();
            List<BETransacciones> datos = new List<BETransacciones>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Transaccion", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new BETransacciones()
                    {
                        id = dr.GetInt32(0),
                        id_usuario = dr.GetInt32(1),
                        tipo = dr.GetInt32(2),
                        monto = dr.GetDecimal(3),
                        fechaCreacion = dr.GetDateTime(4),
                        descripcionTipo = dr.GetString(5),
                        NombreCompleto = dr.GetString(6),
                        montoSoles = dr.GetString(7),
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

                    dato.txtFechaCreacion = dato.fechaCreacion.ToString("dd/MM/yyyy HH:mm:ss");
                    dato.txtNombre = dr.GetString(6);

                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }
    }
}
