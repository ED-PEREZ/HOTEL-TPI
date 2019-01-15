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
            if (!(nombre.Text == "" || dui.Text == "" || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
                || fechaSa.Text == "" || region.SelectedItem.Text == "0" || idhabi=="" || totalG.Text== "" || tiempo.SelectedItem.Text== "0"
                || usert.Value == "" || passt.Value=="") && validar()) {

                string totalaux= total(tiempo.SelectedItem.Text, fechaIn.Text, fechaSa.Text);
                if (totalaux == totalG.Text)
                {
                    MySqlCommand cmd = con.CreateCommand();
                    MySqlCommand mcd = con.CreateCommand();
                    MySqlCommand rcd = con.CreateCommand();
                    MySqlCommand imd = con.CreateCommand();
                    MySqlCommand ucd = con.CreateCommand();

                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO cliente (nombre,dui,usuario,celular,fechaentrada,fechasalida,region,correo,idhabitacion,contra,estadoc,ndias,totalp) VALUES" +
                        " ('" + nombre.Text + "','" + dui.Text + "','" + usert.Value + "','" + cell.Text + "','" + fechaIn.Text + "','" + fechaSa.Text + "','" + region.SelectedItem.Value + "','" + correo.Text + "'," + idhabi + ",'"+passt.Value+"',true,'"+ tiempo.SelectedItem.Text + "',"+ totalG.Text + ")";
                    cmd.ExecuteNonQuery();
                    con.Close();

                    con.Open();
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
                    ucd.CommandType = CommandType.Text;
                    ucd.CommandText = "INSERT INTO usuario (usuario, contra, cargo) VALUES ('"+usert.Value+"','"+passt.Value+"',6)";
                    ucd.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    MySqlCommand hmd = con.CreateCommand();
                    hmd.CommandType = CommandType.Text;
                    hmd.CommandText = "UPDATE habitacion SET estado=true WHERE idhabitacion=" + idhabi;
                    hmd.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    mcd.CommandType = CommandType.Text;
                    mcd.CommandText = "SELECT COUNT(recibo.idrecibo) as cantidad FROM recibo";
                    mcd.ExecuteNonQuery();
                    MySqlDataReader dr = mcd.ExecuteReader();
                    int i = 0;
                    if (dr.Read() == true)
                    {
                        i = int.Parse(dr["cantidad"].ToString());
                    }
                    con.Close();

                    con.Open();
                    rcd.CommandType = CommandType.Text;
                    rcd.CommandText = "INSERT INTO recibo(codigo,idcliente) VALUES(" + i + "," + idclient + ")";
                   
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
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de totalizar')", true);
                }
            }
            else
            {
                if (!existeUsuario()) {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('DATOS YA EXISTEN')", true);
                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Complete Campos')", true);
                }
            }

            con.Close();
        }

        private bool validar()
        {
            try
            {
                if (usert.Value == "" || passt.Value == "") {
                return false;
                }
                else {
                if (existeUsuario()) {
                    return true;
                   }
                }   
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e);
            }
            return false;
        }

        private bool existeUsuario()
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string use="", pass="";

                sqlCOn.Open();
                MySqlCommand bmd = sqlCOn.CreateCommand();
                bmd.CommandType = CommandType.Text;
                bmd.CommandText = "SELECT * FROM cliente WHERE usuario='"+ usert.Value + "' AND contra='"+ passt.Value + "'";
                bmd.ExecuteNonQuery();
                MySqlDataReader rd = bmd.ExecuteReader();
                if (rd.Read() == true)
                {
                   use= rd["usuario"].ToString();
                   pass= rd["contra"].ToString();
                }
                sqlCOn.Close();

                if (usert.Value == use && passt.Value == pass)
                {
                    return false;
                }
                else {
                    return true;
                }
            }
        }

        

        protected void totalizar_Click(object sender, EventArgs e)
        {
            totalG.Text=""+total(tiempo.SelectedItem.Text, fechaIn.Text, fechaSa.Text);
        }

        private string total(string combo,string In,string Sa)
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
                            if (ingreso>=hoy && salida>ingreso) {
                                TimeSpan tdias = salida - ingreso;
                                int diaz = tdias.Days;
                                double to=Convert.ToDouble(precioh) +30*diaz;
                                return Convert.ToString(to);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de definir bien la fecha')", true);
                                return "";
                            }
                        }
                        else {
                            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Complete Campos')", true);
                            return "";
                        }
                    }
                    else if (combo == "Seleccione") {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de seleccionar una opcion')", true);
                        return "";
                    }
                }
                else {
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

        protected void tiempo_SelectedIndexChanged1(object sender, EventArgs e)
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
            Response.Redirect("Home.aspx");
        }
    }
}


