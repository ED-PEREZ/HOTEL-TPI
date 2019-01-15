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
    public partial class EditarReserva : System.Web.UI.Page
    {
        string idh;
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
                        cmd.CommandText = "SELECT a.nombre, a.adelanto, a.fechareserva," +
                            " b.numhabitacion, b.idhabitacion, a.idhabitacion, a.idreserva" +
                            " FROM habitacion b INNER JOIN reserva a ON a.idhabitacion = b.idhabitacion" +
                            " WHERE a.idreserva=" + idh + "";
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read() == true)
                        {
                            nombre.Text = dr["nombre"].ToString();
                            adelanto.Text = dr["adelanto"].ToString();
                            fecha.Text = dr["fechareserva"].ToString();
                            numha.Value = dr["numhabitacion"].ToString();
                            idha.Value = dr["idhabitacion"].ToString();
                            //sirve para ver si se modifico el id de habitacion
                            hfidha.Value = dr["idhabitacion"].ToString();
                            hf.Value = dr["idreserva"].ToString();
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
                string idhab = idha.Value.ToString();
                if (!(nombre.Text == ""  || adelanto.Text == "" || fecha.Text == ""
                    || idhab==""))
                {
                    if (validarfecha(fecha.Text))
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "UPDATE reserva SET nombre='" + nombre.Text + "',adelanto='" + adelanto.Text + "'," +
                            "fechareserva='" + fecha.Text + "',idhabitacion=" + idhab + " WHERE idreserva=" + Convert.ToInt32(hf.Value);
                        int i = cmd.ExecuteNonQuery();
                        sqlCOn.Close();

                        if (idha.Value.ToString() != hfidha.Value.ToString())
                        {
                            sqlCOn.Open();
                            MySqlCommand hmd = sqlCOn.CreateCommand();
                            hmd.CommandType = CommandType.Text;
                            hmd.CommandText = "UPDATE habitacion SET estado=false WHERE idhabitacion=" + hfidha.Value.ToString();
                            hmd.ExecuteNonQuery();
                            sqlCOn.Close();

                            sqlCOn.Open();
                            MySqlCommand vmd = sqlCOn.CreateCommand();
                            vmd.CommandType = CommandType.Text;
                            vmd.CommandText = "UPDATE habitacion SET estado=true WHERE idhabitacion=" + idha.Value.ToString();
                            vmd.ExecuteNonQuery();
                            sqlCOn.Close();
                        }

                        if (i > 0)
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
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "fecha()", true);
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
                }
                
            }
        }

        private bool validarfecha(string text)
        {
            DateTime reserva = Convert.ToDateTime(text);
            string ahorita = Convert.ToString(DateTime.Now.ToString("yyyy-MM-dd"));
            DateTime hoy = Convert.ToDateTime(ahorita);
            if (reserva >= hoy)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}