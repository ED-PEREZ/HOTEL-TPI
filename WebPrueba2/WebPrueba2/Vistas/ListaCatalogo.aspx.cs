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
    public partial class ListaCatalogo : System.Web.UI.Page
    {
        int clienteID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                if (Session["USUARIO"].ToString() == "1" || Session["USUARIO"].ToString() == "2")
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
                cmd.CommandText = "select * from catalogo ";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                ds.Fill(dt);
                gvTipo.DataSource = dt;
                gvTipo.DataBind();
                gvTipo.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btMod_Click(object sender, EventArgs e)
        {
            clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("EditarCatalogo.aspx?id=" + clienteID);
        }

        protected void btEli_Click(object sender, EventArgs e)
        {
            try {
                using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                {
                    clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "delete from catalogo WHERE idcatalogo=" + clienteID + "";

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        sqlCOn.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);
                    }
                    else
                    {
                        sqlCOn.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
                    }
                    sqlCOn.Close();
                }
            } catch (Exception x) {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
            }
            
        }

        protected void btRep_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "abrirVentana('Reportes/ReporteCatalogo.aspx')", true);
        }
    }
}