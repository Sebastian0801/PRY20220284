﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DA
{
    public class ConexionBD
    {
        public static SqlConnection ObtenerConexion()
        {
            //SqlConnection Conn = new SqlConnection("server=10.31.1.220; Initial Catalog=WALLET; uid=sa; pwd=exporta1");
            SqlConnection Conn = new SqlConnection("server=pry20220284.cqfhocnyfrwe.us-east-1.rds.amazonaws.com; Initial Catalog=WALLET; uid=admin; pwd=Zxsder258#$%");
            return Conn;
        } 
    }
}
