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
    public partial class AgregarPedido : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String idc = "";
                if (Request.Params["idcli"] != null)
                {
                    idc = Request.Params["idcli"];
                    using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM recibo WHERE idcliente=" + idc;
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read() == true)
                        {
                            idreci.Value = dr["idrecibo"].ToString();
                        }
                        sqlCOn.Close();
                    }
                }
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            string idp = hf.Value.ToString();
            string idr = idreci.Value.ToString();
            if (!(idp == "" || idr==""))
            {
                MySqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO servicio_cuarto (idrecibo,idproducto) VALUES (" + idr + "," + idp + ")";

                if (cmd.ExecuteNonQuery() > 0)
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);

                }
                else
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);

                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
            }

            //con.Close();
        }
    }
}