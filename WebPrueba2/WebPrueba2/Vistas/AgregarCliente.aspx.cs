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

        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            string idhabi = idha.Value.ToString();
            if (!(nombre.Text == "" || dui.Text == "" || codigo.Text == ""
                || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
                || fechaSa.Text == "" || region.SelectedItem.Text == "0" || idhabi=="")) { 
            
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO cliente (nombre,dui,codigo,celular,fechaentrada,fechasalida,region,correo,idhabitacion) VALUES" +
                    " ('" + nombre.Text + "','" + dui.Text + "','" + codigo.Text + "','" + cell.Text + "','"+fechaIn.Text+"','"+fechaSa.Text+"','"+region.SelectedItem.Value+"','"+correo.Text+"',"+idhabi+")";


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