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
                if (Request.Params["id"] != null)
                {
                    idh = Request.Params["id"];
                    using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT a.nombre, a.dui, a.fechaentrada, a.fechasalida," +
                            " a.idhabitacion, a.correo, a.region, a.celular, a.codigo, b.idhabitacion," +
                            " b.numhabitacion, a.idcliente FROM cliente a " +
                            "INNER JOIN habitacion b ON a.idhabitacion = b.idhabitacion" +
                            " WHERE a.idcliente=" + idh + "";
                        cmd.ExecuteNonQuery();
                        MySqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read() == true)
                        {
                            nombre.Text = dr["nombre"].ToString();
                            dui.Text = dr["dui"].ToString();
                            codigo.Text = dr["codigo"].ToString();
                            correo.Text = dr["correo"].ToString();
                            region.Text = dr["region"].ToString();
                            cell.Text = dr["celular"].ToString();
                            fechaIn.Text = dr["fechaentrada"].ToString();
                            fechaSa.Text = dr["fechasalida"].ToString();
                            idha.Value = dr["idhabitacion"].ToString();
                            habitacion.Text = dr["numhabitacion"].ToString();
                            hf.Value = dr["idcliente"].ToString();
                        }
                        sqlCOn.Close();
                    }
                }
            }
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            //solomodifica
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string idhab = idha.Value.ToString();
                if (!(nombre.Text == "" || dui.Text == "" || codigo.Text == ""
               || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
               || fechaSa.Text == "" || region.SelectedItem.Text == "0" || idhab==""))
                {
                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE cliente SET nombre='"+nombre.Text+"',dui='"+dui.Text+"',codigo='"+codigo.Text+"'" +
                        ",celular='"+cell.Text+"',fechaentrada='"+fechaIn.Text+"',fechasalida='"+fechaSa.Text+"',region='"+region.Text+"'," +
                        "correo='"+correo.Text+"', idhabitacion="+idhab+" WHERE idcliente="+Convert.ToInt32(hf.Value);


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

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
                }
            }
        }

    }
}