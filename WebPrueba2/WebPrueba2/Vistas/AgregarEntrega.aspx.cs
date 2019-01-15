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
    public partial class AgregarEntrega : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        string idservicio="";
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (Request.Params["idservicio"] != null)
                {
                    idservicio = Request.Params["idservicio"];
                }
            
                  
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            string idemp = hf.Value.ToString();
            if (!(idemp == ""))
            {
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "UPDATE servicio_cuarto SET idempleado="+idemp+ ",estado=true WHERE idservicio="+idservicio;

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

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaVerPedidos.aspx");
        }
    }
}