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
    public partial class ListaEmpleado : System.Web.UI.Page
    {
        private MySqlConnection sqlCon = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        int empleadoID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count != 0)
            {
                if (Session["USUARIO"].ToString() == "1" || Session["USUARIO"].ToString() == "2")
                {
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            GridFill();
        }

        void GridFill()
        {
            {
                sqlCon.Open();
                MySqlCommand cmd = sqlCon.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT idempleado, codigoemp, nombre, dui, IF(cargo = 1, 'ADMINISTRADOR', "
                    + "IF(cargo = 2, 'GERENTE', IF(cargo = 3, 'RECEPCIONISTA',"
                    + "IF(empleado.cargo=4,'MANTENIMIENTO','OTRO')))) AS cargo FROM empleado";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                int i = ds.Fill(dt);
                gvEmpleados.DataSource = dt;
                gvEmpleados.DataBind();
                if (i > 0)
                {
                    gvEmpleados.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
                sqlCon.Close();
            }
        }

        protected void Editar_Click(object sender, EventArgs e)
        {
            empleadoID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("Empleado.aspx?id=" + empleadoID);
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            try {
                empleadoID = Convert.ToInt32((sender as LinkButton).CommandArgument);
                sqlCon.Open();
                MySqlCommand cmd = sqlCon.CreateCommand();
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "SELECT usuario from empleado where idempleado ='" + empleadoID + "'";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                ds.Fill(dt);
                String usuario = dt.Rows[0][0].ToString();

                cmd.CommandText = "delete from empleado where idempleado = " + empleadoID;
                cmd.ExecuteNonQuery();

                cmd.CommandText = "delete from usuario where usuario = '" + usuario + "';";
                cmd.ExecuteNonQuery();

                sqlCon.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);
               // Response.Redirect("ListaEmpleado.aspx");
            } catch (Exception x) {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
            }
            
        }

        protected void Reporte_Click(Object sender, EventArgs e)
        {
            empleadoID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            //Response.Redirect("Reportes/ReporteEmpleado.aspx?id=" + empleadoID);
            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "abrirVentana("+empleadoID+")", true);
        }
    }
}