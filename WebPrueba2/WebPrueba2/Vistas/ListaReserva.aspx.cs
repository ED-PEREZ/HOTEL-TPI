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
    public partial class ListaReserva : System.Web.UI.Page
    {
        private MySqlConnection sqlCon = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        int reservaID;
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
                cmd.CommandText = "select * from reserva ";
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
                else {
                    ver.Text = "No hay ningun registro";
                }
            }
        }

        protected void btMod_Click(object sender, EventArgs e)
        {
            reservaID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("EditarReserva.aspx?id=" + reservaID);
        }

        protected void btEli_Click(object sender, EventArgs e)
        {
            try {
                using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                {
                    reservaID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                    string idhabitacion = "";

                    sqlCOn.Open();
                    MySqlCommand hmd = sqlCOn.CreateCommand();
                    hmd.CommandType = CommandType.Text;
                    hmd.CommandText = "SELECT * FROM reserva WHERE idreserva=" + reservaID + "";
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
                    cmd.CommandText = "delete from reserva WHERE idreserva=" + reservaID + "";
                    int i = cmd.ExecuteNonQuery();
                    sqlCOn.Close();

                    sqlCOn.Open();
                    MySqlCommand xmd = sqlCOn.CreateCommand();
                    xmd.CommandType = CommandType.Text;
                    xmd.CommandText = "UPDATE habitacion SET estado=false WHERE idhabitacion=" + idhabitacion + "";
                    xmd.ExecuteNonQuery();
                    sqlCOn.Close();

                    if (i > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
                    }
                    sqlCOn.Close();
                }
            } catch (Exception x) {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
            }           
        }

        protected void agregarc_Click(object sender, EventArgs e)
        {
            reservaID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("AgregarClienteReserva.aspx?id=" + reservaID);
        }

        protected void btRep_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "abrirVentana('Reportes/ReporteReservas.aspx')", true);

        }
    }
}