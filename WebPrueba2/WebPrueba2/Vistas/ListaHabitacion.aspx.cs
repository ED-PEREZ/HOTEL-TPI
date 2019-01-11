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
    public partial class ListaHabitacion : System.Web.UI.Page
    {
        int habitacionID;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridFill();
        }
        private void GridFill()
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT idhabitacion, numhabitacion, IF(estado = true, 'RESERVADO', IF(estado = false, 'DISPONIBLE','NADA')) AS estado FROM habitacion";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                int i= ds.Fill(dt);
                gvTipo.DataSource = dt;
                gvTipo.DataBind();
                if (i>0) {
                    gvTipo.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void btMod_Click(object sender, EventArgs e)
        {
            habitacionID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("EditarHabitac.aspx?id=" + habitacionID);
        }

        protected void btEli_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                habitacionID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "delete from habitacion WHERE idhabitacion=" + habitacionID + "";

                if (cmd.ExecuteNonQuery() > 0)
                {
                    sqlCOn.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);

                }
                else
                {
                    sqlCOn.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);

                }
                sqlCOn.Close();
            }
        }
    }
}