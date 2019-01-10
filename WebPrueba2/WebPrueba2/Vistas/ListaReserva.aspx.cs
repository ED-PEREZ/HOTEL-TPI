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
    public partial class ListaReserva : System.Web.UI.Page
    {
        private MySqlConnection sqlCon = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        int reservaID;
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
                cmd.CommandText = "select * from reserva ";
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
            reservaID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("EditarReserva.aspx?id=" + reservaID);
        }

        protected void btEli_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                reservaID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "delete from reserva WHERE idreserva=" + reservaID + "";

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