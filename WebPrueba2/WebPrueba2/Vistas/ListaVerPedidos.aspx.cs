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
    public partial class ListaVerPedidos : System.Web.UI.Page
    {
        int servicioID;
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
                cmd.CommandText = "SELECT a.idservicio, b.descripcion, b.foto, c.nombre, d.numhabitacion" +
                    " FROM servicio_cuarto a INNER JOIN producto b ON a.idproducto = b.idproducto" +
                    " INNER JOIN recibo ON a.idrecibo = recibo.idrecibo INNER JOIN cliente c ON recibo.idcliente = c.idcliente " +
                    "INNER JOIN habitacion d ON c.idhabitacion = d.idhabitacion WHERE a.estado=FALSE";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                int i = ds.Fill(dt);
                gvTipo.DataSource = dt;
                gvTipo.DataBind();
                if (i > 0)
                {
                    gvTipo.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void btMod_Click(object sender, EventArgs e)
        {
            servicioID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("AgregarEntrega.aspx?id=" + servicioID);
        }
    }
}