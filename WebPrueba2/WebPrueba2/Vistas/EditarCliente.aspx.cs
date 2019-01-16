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
                
                if (Session.Count != 0)
                {
                    if (Session["USUARIO"].ToString() == "1" || Session["USUARIO"].ToString() == "3")
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
                                    " a.idhabitacion, a.correo, a.region, a.celular, a.usuario, b.idhabitacion," +
                                    " b.numhabitacion, a.idcliente,a.ndias,a.totalp FROM cliente a " +
                                    "INNER JOIN habitacion b ON a.idhabitacion = b.idhabitacion" +
                                    " WHERE a.idcliente=" + idh + "";
                                cmd.ExecuteNonQuery();
                                MySqlDataReader dr = cmd.ExecuteReader();
                                string auxi = "";
                                if (dr.Read() == true)
                                {
                                    nombre.Text = dr["nombre"].ToString();
                                    dui.Text = dr["dui"].ToString();
                                    tiempo.Text = dr["ndias"].ToString();
                                    auxi = dr["ndias"].ToString();
                                    totalG.Text = dr["totalp"].ToString();
                                    correo.Text = dr["correo"].ToString();
                                    region.Text = dr["region"].ToString();
                                    cell.Text = dr["celular"].ToString();
                                    fechaIn.Text = dr["fechaentrada"].ToString();
                                    fechaSa.Text = dr["fechasalida"].ToString();
                                    idha.Value = dr["idhabitacion"].ToString();
                                    //si se cambia lahabitacion este mantendrar el valor del anterior
                                    hfidha.Value = dr["idhabitacion"].ToString();
                                    ha.Value = dr["numhabitacion"].ToString();
                                    numha.Value = dr["numhabitacion"].ToString();
                                    hf.Value = dr["idcliente"].ToString();
                                }
                                sqlCOn.Close();
                                if (auxi == "Una noche")
                                {
                                    fechaIn.Enabled = false;
                                    fechaSa.Enabled = false;
                                }
                            }
                        }
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
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
                if (!(nombre.Text == "" || dui.Text == "" || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
               || fechaSa.Text == "" || region.SelectedItem.Text == "0" || idhab=="" || tiempo.SelectedItem.Text=="0"))
                {
                    string totalaux = total(tiempo.SelectedItem.Text, fechaIn.Text, fechaSa.Text);
                    if (totalaux == totalG.Text)
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "UPDATE cliente SET nombre='" + nombre.Text + "',dui='" + dui.Text + "'," +
                            "celular='" + cell.Text + "',fechaentrada='" + fechaIn.Text + "',fechasalida='" + fechaSa.Text + "',region='" + region.Text + "'," +
                            "correo='" + correo.Text + "', idhabitacion=" + idhab + ", ndias='"+ tiempo.SelectedItem.Text + "'," +
                            "totalp="+totalaux+" WHERE idcliente=" + Convert.ToInt32(hf.Value);
                        int i = cmd.ExecuteNonQuery();
                        sqlCOn.Close();

                        if (idha.Value.ToString() != hfidha.Value.ToString())
                        {
                            sqlCOn.Open();
                            MySqlCommand hmd = sqlCOn.CreateCommand();
                            hmd.CommandType = CommandType.Text;
                            hmd.CommandText = "UPDATE habitacion SET estado=false WHERE idhabitacion="+ hfidha.Value.ToString();
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
                    }
                    else {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampo('Debe de totalizar')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
                }
            }
        }

        protected void totalizar_Click(object sender, EventArgs e)
        {
            totalG.Text = "" + total(tiempo.SelectedItem.Text, fechaIn.Text, fechaSa.Text);
        }

        private string total(string combo, string In, string Sa)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string aux = idha.Value.ToString();
                string precioh = "";
                string ingre = In, sali = Sa;

                if (!(aux == ""))
                {
                    sqlCOn.Open();
                    MySqlCommand bmd = sqlCOn.CreateCommand();
                    bmd.CommandType = CommandType.Text;
                    bmd.CommandText = "SELECT b.precio, a.idhabitacion FROM habitacion a " +
                        "INNER JOIN tipo_habitacion b ON a.idtipohabitacion = b.idtipohabitacion WHERE a.idhabitacion=" + aux;
                    bmd.ExecuteNonQuery();
                    MySqlDataReader rd = bmd.ExecuteReader();
                    if (rd.Read() == true)
                    {
                        precioh = rd["precio"].ToString();
                    }
                    sqlCOn.Close();

                    if (combo == "Una noche")
                    {
                        return precioh;
                    }
                    else if (combo == "Uno o mas dias")
                    {
                        if (!(ingre == "" || sali == ""))
                        {

                            DateTime ingreso = Convert.ToDateTime(In), salida = Convert.ToDateTime(Sa);
                            string ahorita = Convert.ToString(DateTime.Now.ToString("yyyy-MM-dd"));
                            DateTime hoy = Convert.ToDateTime(ahorita);
                            if (ingreso >= hoy && salida > ingreso)
                            {
                                TimeSpan tdias = salida - ingreso;
                                int diaz = tdias.Days;
                                double to = Convert.ToDouble(precioh) + 30 * diaz;
                                return Convert.ToString(to);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de definir bien la fecha')", true);
                                return "";
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Complete Campos')", true);
                            return "";
                        }
                    }
                    else if (combo == "Seleccione")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de seleccionar una opcion')", true);
                        return "";
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de seleccionar una habitacion')", true);
                    return "";
                }
            }
            return "";
        }

        protected void tiempo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string num = numha.Value.ToString();
            if (tiempo.SelectedItem.Text == "Seleccione")
            {
                fechaIn.Text = "";
                fechaSa.Text = "";
                fechaIn.Enabled = false;
                fechaSa.Enabled = false;
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "llenar('" + num + "')", true);
            }
            if (tiempo.SelectedItem.Text == "Una noche")
            {
                string hoy = Convert.ToString(DateTime.Now.ToString("yyyy-MM-dd"));
                fechaIn.Text = hoy;
                fechaSa.Text = hoy;
                fechaIn.Enabled = false;
                fechaSa.Enabled = false;
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "llenar('" + num + "')", true);
            }
            if (tiempo.SelectedItem.Text == "Uno o mas dias")
            {
                fechaIn.Text = "";
                fechaSa.Text = "";
                fechaIn.Enabled = true;
                fechaSa.Enabled = true;
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "llenar('" + num + "')", true);
            }
        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaCliente.aspx");
        }
    }
}