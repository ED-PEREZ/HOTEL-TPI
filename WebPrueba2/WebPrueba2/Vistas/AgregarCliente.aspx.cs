using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebPrueba2.Vistas
{
    public partial class AgregarCliente : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                calendarIn.Visible = false;
                calendarSa.Visible = false;
            }
        }

        protected void fechIn_Click(object sender, ImageClickEventArgs e)
        {
            if (calendarIn.Visible)
            {
                calendarIn.Visible = false;
            }
            else
            {
                calendarIn.Visible = true;
            }
        }

        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            fechaIn.Text = calendarIn.SelectedDate.ToShortDateString();
            calendarIn.Visible = false;
        }

        protected void fechSa_Click(object sender, ImageClickEventArgs e)
        {
            if (calendarSa.Visible)
            {
                calendarSa.Visible = false;
            }
            else
            {
                calendarSa.Visible = true;
            }
        }

        protected void calendarSa_SelectionChanged(object sender, EventArgs e)
        {
            fechaSa.Text = calendarSa.SelectedDate.ToShortDateString();
            calendarSa.Visible = false;
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            if (!(nombre.Text == "" || dui.Text == "" || codigo.Text == ""
                || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
                || fechaSa.Text == "" || region.SelectedItem.Text == "0")) { 
            
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO cliente (nombre,dui,codigo,celular,fechaentrada,fechasalida,region,correo) VALUES" +
                    " ('" + nombre.Text + "','" + dui.Text + "','" + codigo.Text + "','" + cell.Text + "','"+fechaIn.Text+"','"+fechaSa.Text+"','"+region.SelectedItem.Value+"','"+correo.Text+"')";


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
    }
}