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
            fechaIn.Enabled = false;
            fechaSa.Enabled = false;
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            con.Open();
            string idhabi = idha.Value.ToString();
            if (!(nombre.Text == "" || dui.Text == "" || usuario.Text == ""
                || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
                || fechaSa.Text == "" || region.SelectedItem.Text == "0" || idhabi=="") && validar()) { 
            
                MySqlCommand cmd = con.CreateCommand();
                MySqlCommand mcd = con.CreateCommand();
                MySqlCommand rcd = con.CreateCommand();
                MySqlCommand imd = con.CreateCommand();

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO cliente (nombre,dui,usuario,celular,fechaentrada,fechasalida,region,correo,idhabitacion) VALUES" +
                    " ('" + nombre.Text + "','" + dui.Text + "','" + usuario.Text + "','" + cell.Text + "','"+fechaIn.Text+"','"+fechaSa.Text+"','"+region.SelectedItem.Value+"','"+correo.Text+"',"+idhabi+")";
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

        protected void tiempo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tiempo.SelectedItem.Text== "Seleccione") {
                fechaIn.Text = "";
                fechaSa.Text = "";
                fechaIn.Enabled = false;
                fechaSa.Enabled = false;
            }
            if (tiempo.SelectedItem.Text == "Una noche") {
                string hoy = Convert.ToString(DateTime.Now.ToString("yyyy-MM-dd"));
                nombre.Text = hoy;
                fechaIn.Text =hoy ;
                fechaSa.Text = hoy;
                fechaIn.Enabled = false;
                fechaSa.Enabled = false;
            }
            if (tiempo.SelectedItem.Text == "Uno o mas dias") {
                fechaIn.Text = "";
                fechaSa.Text = "";
                fechaIn.Enabled = true;
                fechaSa.Enabled = true;
            }
        }

        protected void totalizar_Click(object sender, EventArgs e)
        {
            total();
        }

        private void total()
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string aux = idha.Value.ToString();
                string precioh = "";
                Boolean fe = fechaIn.Enabled, fs=fechaSa.Enabled;
                string ingre = fechaIn.Text, sali = fechaSa.Text;

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

                    if (tiempo.SelectedItem.Text == "Una noche" && fe == false && fs == false)
                    {
                        totalG.Text = precioh;
                    }
                    else if (tiempo.SelectedItem.Text == "Uno o mas dias")
                    {
                        if (!(ingre == "" || sali == ""))
                        {
                           
                            DateTime ingreso = Convert.ToDateTime(fechaIn.Text), salida = Convert.ToDateTime(fechaSa.Text);
                            string ahorita = Convert.ToString(DateTime.Now.ToString("yyyy-MM-dd"));
                            DateTime hoy = Convert.ToDateTime(ahorita);
                            if (ingreso>=hoy && salida>ingreso) {
                                TimeSpan tdias = salida - ingreso;
                                int diaz = tdias.Days;
                                double to=Convert.ToDouble(precioh) +30*diaz;
                                totalG.Text =Convert.ToString(to);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de definir bien la fecha')", true);
                            }
                        }
                        else {
                            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Complete Campos')", true);
                        }
                    }
                    else if (tiempo.SelectedItem.Text == "Seleccione") {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de seleccionar una opcion')", true);
                    }
                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('Debe de seleccionar una habitacion')", true);
                }
            }
                
        }
    }
}