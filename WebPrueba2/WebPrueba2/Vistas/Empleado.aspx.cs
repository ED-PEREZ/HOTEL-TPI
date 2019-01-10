﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace WebPrueba2.Vistas
{
    public partial class AgregarEmpleado : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        int Valor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.Params["id"] != null)
                {
                    this.Valor = int.Parse(Request.Params["id"]);
                    string asc = Request.Params["id"];
                    modificar(this.Valor);
                }
            }
        }

        private void modificar(int valor)
        {
            this.Valor = valor;
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM empleado where idempleado ='" + valor + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
            ds.Fill(dt);
            defi.Disabled = true;
            nacimiento.TextMode = TextBoxMode.DateTime;
            contrato.TextMode = TextBoxMode.DateTime;
            agregar.Text = "MODIFICAR";
            lhe.Text = "MODIFICAR EMPLEADO";
            nombre.Text = dt.Rows[0][2].ToString();
            sexo.SelectedValue = dt.Rows[0][3].ToString();
            nacimiento.Text = Fecha(dt.Rows[0][4].ToString());
            direccion.Text = dt.Rows[0][5].ToString();
            dui.Value = dt.Rows[0][6].ToString();
            nit.Value = dt.Rows[0][7].ToString();
            seguro.Text = dt.Rows[0][8].ToString();
            afp.Text = dt.Rows[0][9].ToString();
            telefono.Value = dt.Rows[0][10].ToString();
            contrato.Text = Fecha(dt.Rows[0][11].ToString());
            cargo.SelectedIndex = int.Parse(dt.Rows[0][12].ToString());
            sueldo.Text = dt.Rows[0][13].ToString();
            usert.Value = dt.Rows[0][14].ToString();
            passt.Value = dt.Rows[0][15].ToString();
            nacimiento.TextMode = TextBoxMode.Date;
            contrato.TextMode = TextBoxMode.Date;
            con.Close();

        }

        private string Fecha(string v)
        {
            string subs = v.Substring(0, 10);
            string[] sc = subs.Split('-');
            return (sc[0] + "-" + sc[1] + "-" + sc[2]);
        }

        protected void agregar_Click(object sender, EventArgs e)
        {
            if (Request.Params["id"] != null)
            {
                this.Valor = int.Parse(Request.Params["id"]);
            }
            if (Validaciones())
            {
                string cont = contrato.Text;
                string naci = nacimiento.Text;
                string duin = dui.Value;
                string nomb = nombre.Text;
                string dire = direccion.Text;
                string nitn = nit.Value;
                string sex = sexo.SelectedItem.Value;
                string seg = seguro.Text;
                string afpn = afp.Text;
                string tel = telefono.Value;
                int carg = cargo.SelectedIndex;
                string user = usert.Value;
                string pass = passt.Value;
                double sueld = double.Parse(sueldo.Text);

                con.Open();
                MySqlCommand cmd = con.CreateCommand();
                MySqlCommand mcd = con.CreateCommand();

                if (this.Valor == 0)
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO empleado(codigoemp, nombre, sexo, " +
                        "fechanacimiento, direccion, dui, nit, nseguro, nafp, telefono, fechacontrato, " +
                        "cargo, sueldo, usuario, contra) VALUES ('" + user + "','" + nomb + "'," +
                        "'" + sex + "','" + naci + "' , '" + dire + "' , '" + duin + "' , '" + nitn + "' , '" + seg + "' , '" + afpn + "','" + tel + "'," +
                        "'" + cont + "','" + carg + "','" + sueld + "','" + user + "','" + pass + "')";


                    mcd.CommandType = CommandType.Text;
                    mcd.CommandText = "INSERT INTO usuario(usuario, contra, cargo) " +
                        "VALUES ('" + user + "','" + pass + "','" + carg + "')";

                    if (cmd.ExecuteNonQuery() > 0 && mcd.ExecuteNonQuery() > 0)
                    {
                        con.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos('Empleado.aspx')", true);

                    }
                    else
                    {
                        con.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);

                    }
                }
                else
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE empleado SET nombre = '" + nomb + "', sexo = '" + sex + "', " +
                        "fechanacimiento = '" + naci + "', direccion = '" + dire + "', dui = '" + duin + "', " +
                        "nit = '" + nitn + "', nseguro = '" + seg + "', nafp = '" + afpn + "', " +
                        "telefono = '" + tel + "', fechacontrato = '" + cont + "', cargo = '" + carg + "', " +
                        "sueldo = '" + sueld + "' WHERE idempleado = '" + this.Valor + "';";

                    mcd.CommandType = CommandType.Text;
                    mcd.CommandText = "UPDATE usuario SET cargo='" + carg + "' WHERE usuario='" + user + "';";

                    int c1 = cmd.ExecuteNonQuery();
                    int c2 = mcd.ExecuteNonQuery();

                    if (c1 > 0 && c2 > 0)
                    {
                        con.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos('ListaEmpleado.aspx')", true);

                    }
                    else
                    {
                        con.Close();
                        //ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);

                    }
                }

            }
            else
            {
                if (!ExistenciasV())
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('DATOS YA EXISTEN')", true);
                }
                ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos('COMPLETE LOS DATOS')", true);
            }
        }

        private bool ExistenciasV()
        {
            int maxi = Maximo();
            int i = 0;
            con.Open();
            while (i <= maxi)
            {
                if (i != Valor)
                {
                    try
                    {
                        MySqlCommand cmd = con.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT idempleado,dui,nit,nseguro,nafp,usuario,contra FROM empleado where idempleado='" + i + "'";
                        cmd.ExecuteNonQuery();
                        DataTable dt = new DataTable();
                        MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                        ds.Fill(dt);
                        string d1 = dt.Rows[0][0].ToString();
                        string d2 = dt.Rows[0][1].ToString();
                        string d3 = dt.Rows[0][2].ToString();
                        string d4 = dt.Rows[0][3].ToString();
                        string d5 = dt.Rows[0][4].ToString();
                        string d6 = dt.Rows[0][5].ToString();
                        string d7 = dt.Rows[0][6].ToString();
                        string duin = dui.Value;
                        string nitn = nit.Value;
                        string seg = seguro.Text;
                        string afpn = afp.Text;
                        string user = usert.Value;
                        string pass = passt.Value;
                        if (d1 == "" + Valor || d2 == duin || d3 == nitn || d4 == seg || d5 == afpn || d6 == user || d7 == pass)
                        {
                            con.Close();
                            return false;
                        }
                    }
                    catch { }
                }
                i++;
            }
            con.Close();
            return true;
        }

        private int Maximo()
        {
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT MAX(idempleado) FROM empleado";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
            ds.Fill(dt);
            int d1 = 0;
            if (dt.Rows[0][0].ToString() != "") { 
                d1 = int.Parse(dt.Rows[0][0].ToString());
            }
            con.Close();
            return d1;
        }

        private bool Validaciones()
        {
            try
            {
                if (dui.Value == "" || nombre.Text == "" || direccion.Text == "" || nit.Value == "" || nacimiento.Text == ""
                    || sexo.SelectedIndex == 0 || seguro.Text == "" || afp.Text == "" || telefono.Value == "" ||
                    cargo.SelectedIndex == 0 || contrato.Text == "" || usert.Value == "" || passt.Value == "" || sueldo.Text == "")
                {
                    return false;
                }
                else
                {
                    if (ExistenciasV())
                    {
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
    }
}