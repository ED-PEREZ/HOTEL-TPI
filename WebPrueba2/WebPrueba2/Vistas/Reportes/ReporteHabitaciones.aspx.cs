using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrueba2.Vistas.Reportes
{
    public partial class ReporteHabitaciones : System.Web.UI.Page
    {
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
                cmd.CommandText = "select * from tipo_habitacion ";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                ds.Fill(dt);
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
                gvTipo.HeaderRow.TableSection = TableRowSection.TableHeader;





                // string imagenes="data:image/jpg;base64,"+Convert.ToBase64String();
            }
        }
    }
}