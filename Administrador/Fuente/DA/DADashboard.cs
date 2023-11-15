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
    public class DADashboard
    {
        public List<int> ValoresDashboard()
        {
            int dato = 0;
            List<int> datos = new List<int>();

            using (SqlConnection con = ConexionBD.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand("SP_Buscar_Datos_Dashboard", con);
                cmd.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dato = dr.GetInt32(1);

                    datos.Add(dato);
                }
                dr.Close();
                con.Close();
            }

            return datos;
        }
    }
}
