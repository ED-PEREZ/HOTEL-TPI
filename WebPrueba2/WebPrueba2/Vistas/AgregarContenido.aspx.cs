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
    public partial class AgregarContenido : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        string idtipo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["id"] != null)
            {
                idtipo = Request.Params["id"];
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            string idC = hf.Value.ToString();
            if (!(idC == ""))
            {
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO contenido_habitacion (idtipo,idcatalogo) VALUES ("+idtipo+","+idC+")";

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