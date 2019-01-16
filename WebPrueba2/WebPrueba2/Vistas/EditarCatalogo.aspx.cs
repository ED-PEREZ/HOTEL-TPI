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
    public partial class EditarCatalogo : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session.Count != 0)
                {
                    if (Session["USUARIO"].ToString() == "1" || Session["USUARIO"].ToString() == "2")
                    {
                        String idh = "";
                        if (Request.Params["id"] != null)
                        {
                            idh = Request.Params["id"];
                            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                            {
                                sqlCOn.Open();
                                MySqlCommand cmd = sqlCOn.CreateCommand();
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "select * from catalogo WHERE idcatalogo=" + idh + "";
                                cmd.ExecuteNonQuery();
                                MySqlDataReader dr = cmd.ExecuteReader();

                                if (dr.Read() == true)
                                {
                                    detalle.Text = dr["descripcion"].ToString();
                                    cantidad.Text = dr["cantidad"].ToString();
                                    hf.Value = dr["idcatalogo"].ToString();
                                }
                                sqlCOn.Close();
                            }
                        }
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                if (!(detalle.Text == "" || cantidad.Text == ""))
                {
                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE catalogo SET descripcion='" + detalle.Text + "',cantidad=" + cantidad.Text + " WHERE idcatalogo=" + Convert.ToInt32(hf.Value);
                    int exito = cmd.ExecuteNonQuery();
                    if (exito > 0)
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);

                    }
                    else
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);

                    }
                    sqlCOn.Close();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
                }
            }
        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaCatalogo.aspx");
        }
    }
}