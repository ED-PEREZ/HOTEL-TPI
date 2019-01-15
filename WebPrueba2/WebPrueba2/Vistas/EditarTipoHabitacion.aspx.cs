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
    public partial class EditarTipoHabitacion : System.Web.UI.Page
    {
        String idh;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Params["id"] != null)
                {
                    idh = Request.Params["id"];
                    using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "select * from tipo_habitacion WHERE idtipohabitacion=" + idh + "";
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read() == true)
                        {
                            tipo.Text = dr["tipohabitacion"].ToString();
                            precio.Text = dr["precio"].ToString();
                            hf.Value = dr["idtipohabitacion"].ToString();
                        }
                        sqlCOn.Close();
                    }
                }
            }
        }

        protected void boton1_Click1(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                if (!(tipo.Text == "" || precio.Text == "") && foto.HasFile)
                {
                    int tamanio = foto.PostedFile.ContentLength;
                    byte[] fot = new byte[tamanio];
                    foto.PostedFile.InputStream.Read(fot, 0, tamanio);
                    Bitmap imagenOriginal = new Bitmap(foto.PostedFile.InputStream);

                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE tipo_habitacion SET tipohabitacion='" + tipo.Text + "',precio="+precio.Text+",foto=@foto WHERE idtipohabitacion=" + Convert.ToInt32(hf.Value);
                    cmd.Parameters.Add("@foto", MySqlDbType.Binary).Value = fot;
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

        protected void boton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaTipoHabitacion.aspx");
        }
    }
}