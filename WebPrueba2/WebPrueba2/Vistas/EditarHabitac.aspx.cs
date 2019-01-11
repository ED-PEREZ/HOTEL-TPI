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
    public partial class EditarHabitac : System.Web.UI.Page
    {
        String idh;
        protected void Page_Load(object sender, EventArgs e)
        {
            idtipoh.Visible = false;
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
                        cmd.CommandText = "SELECT a.numhabitacion,a.idhabitacion, b.tipohabitacion,b.idtipohabitacion FROM habitacion a INNER JOIN tipo_habitacion b ON a.idtipohabitacion = b.idtipohabitacion WHERE idhabitacion=" + idh+"";
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read() == true)
                        {
                            numero.Text = dr["numhabitacion"].ToString();
                            tipo.Text = dr["tipohabitacion"].ToString();
                            idth.Value = dr["idtipohabitacion"].ToString();
                            hf.Value = dr["idhabitacion"].ToString();
                        }
                        sqlCOn.Close();
                    }
                }
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string idtipoh = idth.Value.ToString();
                if (!(numero.Text == "" || idtipoh==""))
                {
                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE habitacion SET numhabitacion=" + numero.Text + ", idtipohabitacion="+idtipoh+" WHERE idhabitacion=" + Convert.ToInt32(hf.Value);
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
    }
}