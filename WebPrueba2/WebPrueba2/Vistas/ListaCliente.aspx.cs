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
    public partial class ListaCliente : System.Web.UI.Page
    {
        int clienteID;
        protected void Page_Load(object sender, EventArgs e)
        {
            contenedor.Visible = false;
            algo.Visible = false;
            ja.Visible = false;
            GridFill();
        }

        private void GridFill()
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from cliente ";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
               int i= ds.Fill(dt);
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
            clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("EditarCliente.aspx?id=" + clienteID);
        }

        protected void btEli_Click(object sender, EventArgs e)
        {
           //ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "eliminar()", true);
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                
                //contenedor.Text = "" + Convert.ToInt32((sender as LinkButton).CommandArgument);
                //if (algo.Text == "eliminar" && !(contenedor.Text==""))
                //{
                // contenedor.Text = "" + Convert.ToInt32((sender as LinkButton).CommandArgument)
                    clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "delete from cliente WHERE idcliente="+clienteID+"";

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
                //}
            }
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("CancelarRecibo.aspx?idcli=" + clienteID);
        }
    }
}