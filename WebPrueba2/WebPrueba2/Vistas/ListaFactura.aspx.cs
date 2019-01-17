using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrueba2.Vistas
{
    public partial class ListaFactura : System.Web.UI.Page
    {
        int fact;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                if (Session["USUARIO"].ToString() == "1" || Session["USUARIO"].ToString() == "3")
                {
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
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
                    "a.usuario, a.contra, a.estadoc, a.ndias, a.totalp, b.total, b.idrecibo FROM cliente a " +
                    "INNER JOIN recibo b ON b.idcliente = a.idcliente WHERE a.estadoc =false";
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
                else {
                    ver.Text="No hay ningun registro";
                }
            }
        }

        protected void btRep_Click(object sender, EventArgs e)
        {
            fact = Convert.ToInt32((sender as LinkButton).CommandArgument);
            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "abrirVentana('Reportes/ReporteFactura.aspx?id=" + fact + "')", true);
        }

        protected void btRepm_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "abrirVentana('Reportes/ReporteFacturas.aspx')", true);
        }
    }
}