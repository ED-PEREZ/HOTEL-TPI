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
    public partial class Login : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        string id = "";
        string nivel = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["id"] != null)
            {
                if (int.Parse(Request.Params["id"]) == 0)
                {
                    Session.Clear();
                    Response.Redirect("Login.aspx");
                }
                else { Response.Redirect("Login.aspx"); }
            }
        }

        protected void boton1_Click(object sender, EventArgs e)
        {
            con.Open();
            if (!(user.Text == "" || pass.Text == ""))
            {
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from usuario where usuario='" + user.Text + "' and contra='" + pass.Text + "' ";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);

                if (ds.Fill(dt) > 0)
                {
                    
                    foreach (DataRow dr in dt.Rows)
                    {

                        this.nivel = dt.Rows[0][3].ToString();
                        Session.Add("USUARIO",this.nivel);
                        if (nivel=="6") {
                            this.id =dt.Rows[0][4].ToString();
                            Session.Add("CLIENTE", this.id);
                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);
                    }
                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
                }
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
            }
            con.Close();
            
        }
    }
}