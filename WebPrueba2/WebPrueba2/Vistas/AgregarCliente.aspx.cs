using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebPrueba2.Vistas
{
    public partial class AgregarCliente : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            string idhabi = idha.Value.ToString();
            if (!(nombre.Text == "" || dui.Text == "" || codigo.Text == ""
                || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
                || fechaSa.Text == "" || region.SelectedItem.Text == "0" || idhabi=="")) { 
            
                MySqlCommand cmd = con.CreateCommand();
                MySqlCommand mcd = con.CreateCommand();
                MySqlCommand rcd = con.CreateCommand();
                MySqlCommand imd = con.CreateCommand();

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO cliente (nombre,dui,codigo,celular,fechaentrada,fechasalida,region,correo,idhabitacion) VALUES" +
                    " ('" + nombre.Text + "','" + dui.Text + "','" + codigo.Text + "','" + cell.Text + "','"+fechaIn.Text+"','"+fechaSa.Text+"','"+region.SelectedItem.Value+"','"+correo.Text+"',"+idhabi+")";
                cmd.ExecuteNonQuery();

                imd.CommandType = CommandType.Text;
                imd.CommandText = "SELECT * FROM cliente ORDER by cliente.idcliente DESC LIMIT 1";
                imd.ExecuteNonQuery();
                MySqlDataReader dc = imd.ExecuteReader();
                int idclient = 0;
                if (dc.Read() == true)
                {
                    idclient = int.Parse(dc["idcliente"].ToString());
                }

                con.Close();
                con.Open();
                mcd.CommandType = CommandType.Text;
                mcd.CommandText = "SELECT COUNT(recibo.idrecibo) as cantidad FROM recibo";
                mcd.ExecuteNonQuery();
                MySqlDataReader dr = mcd.ExecuteReader();
                int i = 0;
                if (dr.Read() == true)
                {
                  i =int.Parse(dr["cantidad"].ToString());
                }

                con.Close();
                con.Open();

                rcd.CommandType = CommandType.Text;
                rcd.CommandText = "INSERT INTO recibo(codigo,idcliente) VALUES("+i+","+idclient+")";

                if (rcd.ExecuteNonQuery() > 0)
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

            con.Close();
        }
    }
}