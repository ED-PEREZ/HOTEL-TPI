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
    public partial class EditarCliente : System.Web.UI.Page
    {
        string idh;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                calendarIn.Visible = false;
                calendarSa.Visible = false;
                if (Request.Params["id"] != null)
                {
                    idh = Request.Params["id"];
                    using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "select nombre,dui,fechaentrada,fechasalida,correo,region,celular from cliente WHERE idcliente=" + idh + "";
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read() == true)
                        {
                            nombre.Text = dr["nombre"].ToString();
                            dui.Text = dr["dui"].ToString();
                            correo.Text = dr["correo"].ToString();
                            region.Text = dr["region"].ToString();
                            cell.Text = dr["celular"].ToString();
                            fechaIn.Text = dr["fechaentrada"].ToString();
                            fechaSa.Text = dr["fechasalida"].ToString();
                            hf.Value = dr["idcliente"].ToString();
                        }
                        sqlCOn.Close();
                    }
                }
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {

        }

        protected void fechIn_Click(object sender, ImageClickEventArgs e)
        {
            if (calendarIn.Visible)
            {
                calendarIn.Visible = false;
            }
            else
            {
                calendarIn.Visible = true;
            }
        }

        protected void calendar_SelectionChanged(object sender, EventArgs e)
        {
            fechaIn.Text = calendarIn.SelectedDate.ToShortDateString();
            calendarIn.Visible = false;
        }

        protected void fechSa_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}