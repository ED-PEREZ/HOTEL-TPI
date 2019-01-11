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
    public partial class AgregarCatalogo : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            if (!(detalle.Text == "" || cantidad.Text == "") )
            {
                
                int costo = Convert.ToInt32(cantidad.Text);
               
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
               // cmd.CommandText = "UPDATE catalogo SET descripcion='" + detalle.Text + "' WHERE idcatalogo=1";
                cmd.CommandText = "INSERT INTO catalogo (descripcion,cantidad) VALUES ('"+detalle.Text+"',"+cantidad.Text+")";


                if (cmd.ExecuteNonQuery()>0)
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