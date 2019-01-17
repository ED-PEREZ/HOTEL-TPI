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
                cmd.CommandText = "select * from cliente WHERE estadoc=true";
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
            try {
                //ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "eliminar()", true);
                using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                {

                    //contenedor.Text = "" + Convert.ToInt32((sender as LinkButton).CommandArgument);
                    //if (algo.Text == "eliminar" && !(contenedor.Text==""))
                    //{
                    // contenedor.Text = "" + Convert.ToInt32((sender as LinkButton).CommandArgument)
                    clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                    string idhabitacion = "";

                    sqlCOn.Open();
                    MySqlCommand hmd = sqlCOn.CreateCommand();
                    hmd.CommandType = CommandType.Text;
                    hmd.CommandText = "SELECT * FROM cliente WHERE idcliente=" + clienteID + "";
                    hmd.ExecuteNonQuery();
                    MySqlDataReader dr = hmd.ExecuteReader();
                    if (dr.Read() == true)
                    {
                        idhabitacion = dr["idhabitacion"].ToString();
                    }
                    sqlCOn.Close();

                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "delete from cliente WHERE idcliente=" + clienteID + "";
                    int i = cmd.ExecuteNonQuery();
                    sqlCOn.Close();
                    if (i > 0)
                    {
                        sqlCOn.Open();
                        MySqlCommand dmd = sqlCOn.CreateCommand();
                        dmd.CommandType = CommandType.Text;
                        dmd.CommandText = "UPDATE habitacion SET estado=false WHERE idhabitacion=" + idhabitacion + "";
                        dmd.ExecuteNonQuery();
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand ucd = sqlCOn.CreateCommand();
                        ucd.CommandType = CommandType.Text;
                        ucd.CommandText = "DELETE FROM usuario WHERE idcliente=" + clienteID;
                        ucd.ExecuteNonQuery();
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
            } catch (Exception x) {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
            }          
        }

        protected void Cancelar_Click(object sender, EventArgs e)
        {
            clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("CancelarRecibo.aspx?idcli=" + clienteID);
        }

        protected void btRep_Click(object sender, EventArgs e)
        {
            clienteID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "abrirVentana('Reportes/ReporteCliente.aspx?id=" + clienteID + "')", true);
        }

        protected void btRepm_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "abrirVentana('Reportes/ReporteClientes.aspx')", true);
        }
    }
}