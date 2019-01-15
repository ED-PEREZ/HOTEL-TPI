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
    public partial class BuscarHabitacionVer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Params["id"] != null)
                {
                    string idaux= Request.Params["id"]; 
                    using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT a.descripcion, a.cantidad FROM catalogo a" +
                            " INNER JOIN contenido_habitacion b ON b.idcatalogo = a.idcatalogo INNER JOIN tipo_habitacion c ON b.idtipo = c.idtipohabitacion" +
                            " WHERE c.idtipohabitacion ="+idaux;
                        cmd.ExecuteNonQuery();
                        DataTable dt = new DataTable();
                        MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                        int i = ds.Fill(dt);
                        gvTipo.DataSource = dt;
                        gvTipo.DataBind();
                        if (i > 0)
                        {
                            gvTipo.HeaderRow.TableSection = TableRowSection.TableHeader;
                        }
                        else
                        {

                        }
                    }
                }
            }
            
        }
    }
}