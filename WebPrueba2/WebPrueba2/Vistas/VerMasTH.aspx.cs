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
    public partial class VerMasTH : System.Web.UI.Page
    {
        string tipoHabitacionID;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridFill();
        }
        void GridFill()
        {
            if (!IsPostBack)
            {
                if (Request.Params["id"] != null)
                {
                    tipoHabitacionID = Request.Params["id"];

                    using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                    {
                        sqlCOn.Open();
                        MySqlCommand smd = sqlCOn.CreateCommand();
                        smd.CommandType = CommandType.Text;
                        smd.CommandText = "SELECT b.descripcion, b.cantidad, c.idtipohabitacion FROM contenido_habitacion a " +
                            "INNER JOIN catalogo b ON a.idcatalogo = b.idcatalogo INNER JOIN tipo_habitacion c ON a.idtipo = c.idtipohabitacion " +
                            "WHERE c.idtipohabitacion=" + tipoHabitacionID;
                        smd.ExecuteNonQuery();
                        DataTable tt = new DataTable();
                        MySqlDataAdapter dc = new MySqlDataAdapter(smd);
                        int i = dc.Fill(tt);
                        gvTipo.DataSource = tt;
                        gvTipo.DataBind();
                        if (i < 1)
                        {
                            Label1.Text = "No hay ningun registo";
                        }
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM tipo_habitacion WHERE idtipohabitacion = " + tipoHabitacionID;
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read()==true)
                        {
                            hf.Value = dr["idtipohabitacion"].ToString();
                        }
                        sqlCOn.Close();

                    }
                }
            }
        }

        protected void pagar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(hf.Value.ToString());
            Response.Redirect("AgregarContenido.aspx?id=" + id);
        }

        protected void btEli_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                int id= Convert.ToInt32((sender as LinkButton).CommandArgument);
                sqlCOn.Open();
                MySqlCommand cmd = sqlCOn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "delete from contenido_habitacion WHERE idtipo=" + id + "";

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