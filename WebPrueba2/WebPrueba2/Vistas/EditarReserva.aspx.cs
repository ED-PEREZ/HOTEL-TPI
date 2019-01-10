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
                        cmd.CommandText = "select * FROM reserva WHERE idreserva=" + idh + "";
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read() == true)
                        {
                            nombre.Text = dr["nombre"].ToString();
                            codigo.Text = dr["codigo"].ToString();
                            adelanto.Text = dr["adelanto"].ToString();
                            fecha.Text = dr["fechareserva"].ToString();
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
                if (!(nombre.Text == "" || codigo.Text == "" || adelanto.Text == "" || fecha.Text == ""
                    || idhab==""))
                {
                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE reserva SET nombre='"+nombre.Text+"',codigo='"+codigo.Text+"',adelanto='"+adelanto.Text+"'," +
                        "fechareserva='"+fecha.Text+"',idhabitacion="+idhab+" WHERE idreserva=" + Convert.ToInt32(hf.Value);


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
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
                }
                
            }
        }
    }
}