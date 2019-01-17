using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrueba2.Vistas.Reportes
{
    public partial class ReporteFacturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridFill();
        }
        private void GridFill()
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT a.idcliente, a.nombre, a.dui, a.fechaentrada, a.fechasalida, a.idhabitacion, a.correo, a.region, a.celular, " +
                    "a.usuario, a.contra, a.estadoc, a.ndias, a.totalp, b.total, b.fecha FROM cliente a " +
                    "INNER JOIN recibo b ON b.idcliente = a.idcliente WHERE a.estadoc =false";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                int i = ds.Fill(dt);
                gvTipo.DataSource = dt;
                gvTipo.DataBind();
                
            }
        }
    }
}