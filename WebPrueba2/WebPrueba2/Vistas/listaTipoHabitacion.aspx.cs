using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrueba2.Vistas
{
    public partial class listaTipoHabitacion : System.Web.UI.Page
    {
        private object container;
        int tipoHabitacionID;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridFill();
        }
        void GridFill()
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from tipo_habitacion ";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                int i= ds.Fill(dt);
                /*DataRow r = dt.Rows[1];
                String b = "data:image/jpg;base64," + Convert.ToBase64String((byte[])r[3]);
                im.ImageUrl = b;
                /*
                DataColumn foto = new DataColumn("foton", typeof(System.String));
                dt.Columns.Add(foto);
                
                foreach (DataRow dr in dt.Rows)
                {
                    String b ="data:image/jpg;base64,"+ Convert.ToBase64String((byte[])dr[3]);
                    dr[4] = b;
                }
                /*
                BoundField bfield = new BoundField();
                bfield.DataField = dt.Columns[4].ColumnName;
                bfield.HeaderText = dt.Columns[4].ColumnName;
                bfield.ReadOnly = true;
                gvTipo.Columns.Add(bfield);*/
                gvTipo.DataSource = dt;
                gvTipo.DataBind();
                if (i>0) {
                    gvTipo.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                // string imagenes="data:image/jpg;base64,"+Convert.ToBase64String();
            }
        }


        protected void Clic(object sender, EventArgs e) {
            var x = (sender as Button).CommandArgument;
            int id = Convert.ToInt32((sender as Button ).CommandArgument);    
        }

        protected void btMod_Click(object sender, EventArgs e)
        {
            tipoHabitacionID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("EditarTipoHabitacion.aspx?id=" + tipoHabitacionID);
        }

        protected void btEli_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                tipoHabitacionID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "delete from tipo_habitacion WHERE idtipohabitacion=" + tipoHabitacionID + "";

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