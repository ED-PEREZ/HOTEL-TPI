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
    public partial class AgregarProducto : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void boton1_Click(object sender, EventArgs e)
        {
         
            con.Open();
            if (!(descripcion.Text == "" || precio.Text == "") && foto.HasFile)
            {
                int tamanio = foto.PostedFile.ContentLength;
                byte[] fot = new byte[tamanio];
                foto.PostedFile.InputStream.Read(fot, 0, tamanio);
                Bitmap imagenOriginal = new Bitmap(foto.PostedFile.InputStream);

                Double costo = 0.0;
                if (!(precio.Text == ""))
                {
                    costo = Convert.ToDouble(precio.Text);
                }
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO producto (descripcion,precio,foto) VALUES (@des,@precio,@foto)";
                cmd.Parameters.Add("@des", MySqlDbType.Text).Value = descripcion.Text;
                cmd.Parameters.Add("@precio", MySqlDbType.Double).Value = costo;
                cmd.Parameters.Add("@foto", MySqlDbType.Binary).Value = fot;
                //cmd.ExecuteNonQuery();

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