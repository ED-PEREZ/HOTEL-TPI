using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebPrueba2
{
    public class Conexion
    {
        public static MySqlConnection ObtenerConexion()
        {
            MySqlConnection conectar = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=;");
            
            conectar.Open();
            return conectar;
        }
    }
}