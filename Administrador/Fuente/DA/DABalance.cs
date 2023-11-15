using BE;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DA
{
	public class DABalance
	{
        public List<BEBalance> ListarBalance()
        {
            BEBalance dato = new BEBalance();
            List<BEBalance> datos = new List<BEBalance>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Balance", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = new BEBalance()
                    {
                        id = dr.GetInt32(0),
                        id_usuario = dr.GetInt32(1),
                        balance = dr.GetDecimal(2),
                        txtNombre = dr.GetString(3),
                        txtBalance = dr.GetString(4)
                    };
                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }
    }
}
