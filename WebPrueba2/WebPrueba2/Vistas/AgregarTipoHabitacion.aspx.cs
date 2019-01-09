using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrueba2.Vistas
{
    public partial class AgregarTipoHabitacion : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void boton1_Click1(object sender, EventArgs e)
        {
            con.Open();
            if (!(tipo.Text == "" || precio.Text == "") && foto.HasFile)
            {
                int tamanio = foto.PostedFile.ContentLength;
                byte[] fot = new byte[tamanio];
                foto.PostedFile.InputStream.Read(fot,0,tamanio);
                Bitmap imagenOriginal = new Bitmap(foto.PostedFile.InputStream);


                Double costo =0.0;
                if (!(precio.Text=="")) {
                    costo = Convert.ToDouble(precio.Text);
                }
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO tipo_habitacion (tipohabitaccion,precio,foto) VALUES (@tipo,@precio,@foto)";
                cmd.Parameters.Add("@tipo", MySqlDbType.Text).Value = tipo.Text;
                cmd.Parameters.Add("@precio", MySqlDbType.Double).Value = costo;
                cmd.Parameters.Add("@foto", MySqlDbType.Binary).Value = fot;
                //cmd.ExecuteNonQuery();

                String b = "data:image/jpg;base64," + Convert.ToBase64String(fot);
      
                tipo.Text = "";
                precio.Text = "";
                foto = null;

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
