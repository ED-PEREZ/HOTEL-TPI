﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebPrueba2.Vistas
{
    public partial class ReporteEmpleados : System.Web.UI.Page
    {
        private MySqlConnection sqlCon = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");

        protected void Page_Load(object sender, EventArgs e)
        {
            GridFill();
        }

        void GridFill()
        {
            {
                sqlCon.Open();
                MySqlCommand cmd = sqlCon.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT idempleado, codigoemp, nombre, dui, nit, nafp, nseguro, IF(cargo = 1, 'ADMINISTRADOR', "
                    + "IF(cargo = 2, 'GERENTE', IF(cargo = 3, 'RECEPCIONISTA',"
                    + "IF(empleado.cargo=4,'RECEPCIONISTA',IF(empleado.cargo = 5, 'CAMARERO','OTRO'))))) " +
                    "AS cargo FROM empleado";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                ds.Fill(dt);
                gvEmpleados.DataSource = dt;
                gvEmpleados.DataBind();
                sqlCon.Close();
            }
        }
    }
}