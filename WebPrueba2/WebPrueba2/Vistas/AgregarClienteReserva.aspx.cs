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
    public partial class AgregarClienteReserva : System.Web.UI.Page
    {
        string idr;
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
                            idr = Request.Params["id"];
                            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                            {
                                sqlCOn.Open();
                                MySqlCommand cmd = sqlCOn.CreateCommand();
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "SELECT a.idreserva, a.nombre, a.fechareserva, a.adelanto, a.idhabitacion, b.numhabitacion" +
                                    " FROM reserva a INNER JOIN habitacion b ON a.idhabitacion = b.idhabitacion WHERE a.idreserva=" + idr + "";
                                cmd.ExecuteNonQuery();
                                MySqlDataReader dr = cmd.ExecuteReader();

                                if (dr.Read() == true)
                                {
                                    nombre.Text = dr["nombre"].ToString();
                                    idre.Value = dr["idreserva"].ToString();
                                    ade.Value = dr["adelanto"].ToString();
                                    fechaIn.Text = dr["fechareserva"].ToString();
                                    numha.Value = dr["numhabitacion"].ToString();
                                    idha.Value = dr["idhabitacion"].ToString();
                                    ////si se cambia lahabitacion este mantendrar el valor del anterior
                                    hfidha.Value = dr["idhabitacion"].ToString();
                                    nuhar.Value = dr["numhabitacion"].ToString();
                                    ha.Value = dr["numhabitacion"].ToString();
                                }
                                sqlCOn.Close();
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
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string idhabi = idha.Value.ToString();
                if (!(nombre.Text == "" || dui.Text == "" || correo.Text == "" || cell.Text == "" || fechaIn.Text == ""
                    || fechaSa.Text == "" || region.SelectedItem.Text == "0" || idhabi == "" || totalG.Text == "" || tiempo.SelectedItem.Text == "0"
                    || usert.Value == "" || passt.Value == "") && validar())
                {
                    string totalaux = total(tiempo.SelectedItem.Text, fechaIn.Text, fechaSa.Text);
                    if (totalaux == totalG.Text)
                    {
                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "INSERT INTO cliente (nombre,dui,usuario,celular,fechaentrada,fechasalida,region,correo,idhabitacion,contra,estadoc,ndias,totalp) VALUES" +
                            " ('" + nombre.Text + "','" + dui.Text + "','" + usert.Value + "','" + cell.Text + "','" + fechaIn.Text + "','" + fechaSa.Text + "','" + region.SelectedItem.Value + "','" + correo.Text + "'," + idhabi + ",'" + passt.Value + "',true,'" + tiempo.SelectedItem.Text + "'," + totalG.Text + ")";
                        int j=cmd.ExecuteNonQuery();
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand imd = sqlCOn.CreateCommand();
                        imd.CommandType = CommandType.Text;
                        imd.CommandText = "SELECT * FROM cliente ORDER by cliente.idcliente DESC LIMIT 1";
                        imd.ExecuteNonQuery();
                        MySqlDataReader dc = imd.ExecuteReader();
                        int idclient = 0;
                        if (dc.Read() == true)
                        {
                            idclient = int.Parse(dc["idcliente"].ToString());
                        }
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand ucd = sqlCOn.CreateCommand();
                        ucd.CommandType = CommandType.Text;
                        ucd.CommandText = "INSERT INTO usuario (usuario, contra, cargo,idcliente) VALUES ('" + usert.Value + "','" + passt.Value + "',6," + idclient + ")";
                        ucd.ExecuteNonQuery();
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand mcd = sqlCOn.CreateCommand();
                        mcd.CommandType = CommandType.Text;
                        mcd.CommandText = "SELECT COUNT(recibo.idrecibo) as cantidad FROM recibo";
                        mcd.ExecuteNonQuery();
                        MySqlDataReader dr = mcd.ExecuteReader();
                        int i = 0;
                        if (dr.Read() == true)
                        {
                            i = int.Parse(dr["cantidad"].ToString());
                        }
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand rcd = sqlCOn.CreateCommand();
                        rcd.CommandType = CommandType.Text;
                        rcd.CommandText = "INSERT INTO recibo(codigo,idcliente) VALUES(" + i + "," + idclient + ")";
                        rcd.ExecuteNonQuery();
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand rmd = sqlCOn.CreateCommand();
                        rmd.CommandType = CommandType.Text;
                        rmd.CommandText = "DELETE FROM reserva WHERE idreserva="+ idre.Value.ToString();
                        rmd.ExecuteNonQuery();
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

                        if (j > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampo('Debe de totalizar')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
                }
            }
        }

        private bool validar()
        {
            try
            {
                if (usert.Value == "" || passt.Value == "")
                {
                    return false;
                }
                else
                {
                    if (existeUsuario())
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

        private bool existeUsuario()
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string use = "", pass = "";

                sqlCOn.Open();
                MySqlCommand bmd = sqlCOn.CreateCommand();
                bmd.CommandType = CommandType.Text;
                bmd.CommandText = "SELECT * FROM cliente WHERE usuario='" + usert.Value + "' AND contra='" + passt.Value + "'";
                bmd.ExecuteNonQuery();
                MySqlDataReader rd = bmd.ExecuteReader();
                if (rd.Read() == true)
                {
                    use = rd["usuario"].ToString();
                    pass = rd["contra"].ToString();
                }
                sqlCOn.Close();

                if (usert.Value == use && passt.Value == pass)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
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
                        double to = Convert.ToDouble(rd["precio"].ToString()) - Convert.ToDouble(ade.Value.ToString());
                        precioh = Convert.ToString(to);
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
                                double to = Convert.ToDouble(precioh) + (30 * diaz) - Convert.ToDouble(ade.Value.ToString());
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

        protected void totalizar_Click(object sender, EventArgs e)
        {
            totalG.Text = "" + total(tiempo.SelectedItem.Text, fechaIn.Text, fechaSa.Text);
        }

        protected void res_Click(object sender, EventArgs e)
        {
            idha.Value=hfidha.Value;
            numha.Value = nuhar.Value;
            ha.Value = numha.Value;
        }
    }
}