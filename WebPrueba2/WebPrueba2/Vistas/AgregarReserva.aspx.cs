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
    public partial class AgregarReserva : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                calendar.Visible = false;
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            if (!(nombre.Text == "" || codigo.Text == "" || adelanto.Text=="" || fecha.Text==""))
            {
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO reserva (nombre,codigo,adelanto,fechareserva) VALUES ('" + nombre.Text + "','" + codigo.Text + "',"+adelanto.Text+",'"+fecha.Text+"')";


                if (cmd.ExecuteNonQuery() > 0)
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);

                }
                else
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);

                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
            }

            con.Close();
        }

        protected void fech_Click(object sender, ImageClickEventArgs e)
        {
            if (calendar.Visible)
            {
                calendar.Visible = false;
            }
            else {
                calendar.Visible = true;
            }
        }

        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            //  fecha.Text=calendar.SelectedDate.ToLongDateString();
            fecha.Text = calendar.SelectedDate.ToShortDateString();
            calendar.Visible = false;
        }
    }
}