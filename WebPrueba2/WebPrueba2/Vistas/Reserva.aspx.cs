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
    public partial class Reserva : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            string idhab = ContentPlaceHolder1_idha.Value.ToString();
            if (!(nombre.Text == "" || adelanto.Text == "" || fecha.Text == "" ||
                idhab == ""))
            {
                if (validarfecha(fecha.Text))
                {
                    MySqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO reserva (nombre,adelanto,fechareserva,idhabitacion) VALUES ('" + nombre.Text + "'," + adelanto.Text + ",'" + fecha.Text + "'," + idhab + ")";
                    cmd.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    MySqlCommand hmd = con.CreateCommand();
                    hmd.CommandType = CommandType.Text;
                    hmd.CommandText = "UPDATE habitacion SET estado=true WHERE idhabitacion=" + idhab;
                    int i=hmd.ExecuteNonQuery();
                    con.Close();

                    if (i > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "fecha()", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
            }

            con.Close();
        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        private bool validarfecha(string text)
        {
            DateTime reserva = Convert.ToDateTime(text);
            string ahorita = Convert.ToString(DateTime.Now.ToString("yyyy-MM-dd"));
            DateTime hoy = Convert.ToDateTime(ahorita);
            if (reserva >= hoy)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}