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
    public partial class CancelarRecibo : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        string idc="";
        double totalRecibo = 0.0;
        protected void Page_Load(object sender, EventArgs e)
        {
            fecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
            if (!IsPostBack)
            {
                if (Request.Params["idcli"] != null)
                {
                    idc = Request.Params["idcli"];
                    using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                    {
                        
                        sqlCOn.Open();
                        MySqlCommand smd = sqlCOn.CreateCommand();
                        smd.CommandType = CommandType.Text;
                        smd.CommandText = "SELECT a.idproducto, a.descripcion, a.precio, a.foto FROM producto a" +
                            " INNER JOIN servicio_cuarto b ON b.idproducto = a.idproducto " +
                            "INNER JOIN recibo c ON b.idrecibo = c.idrecibo WHERE b.estado=TRUE AND c.idcliente=" + idc;
                        smd.ExecuteNonQuery();
                        DataTable tt = new DataTable();
                        MySqlDataAdapter dc = new MySqlDataAdapter(smd);
                        int i = dc.Fill(tt);
                        gvFalse.DataSource = tt;
                        gvFalse.DataBind();
                        if (i < 1)
                        {
                            Label1.Text = "No ha solicitado ningun pedido";
                        }
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand cmd = sqlCOn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT a.numhabitacion, b.tipohabitacion, b.precio, b.foto, c.idcliente,c.totalp FROM habitacion a " +
                            "INNER JOIN tipo_habitacion b ON a.idtipohabitacion = b.idtipohabitacion " +
                            "INNER JOIN cliente c ON c.idhabitacion = a.idhabitacion WHERE c.idcliente=" + idc;
                        cmd.ExecuteNonQuery();
                        DataTable td = new DataTable();
                        MySqlDataAdapter cd = new MySqlDataAdapter(cmd);
                        int j=cd.Fill(td);
                        gvTipo.DataSource = td;
                        gvTipo.DataBind();
                        MySqlDataReader rd = cmd.ExecuteReader();
                        if (j < 1)
                        {
                            Label1.Text = "No ha solicitado ningun pedido";

                        }
                        if (rd.Read() == true)
                        {
                            hf.Value = rd["idcliente"].ToString();
                            totalRecibo = totalRecibo+ Convert.ToDouble(rd["totalp"].ToString());
                        }
                        sqlCOn.Close();

                        sqlCOn.Open();
                        MySqlCommand mcd = sqlCOn.CreateCommand();
                        mcd.CommandType = CommandType.Text;
                        mcd.CommandText = "SELECT SUM(a.precio) total FROM producto a INNER JOIN servicio_cuarto b ON b.idproducto = a.idproducto INNER JOIN recibo c ON b.idrecibo = c.idrecibo WHERE b.estado=TRUE AND c.idcliente="+idc;
                        mcd.ExecuteNonQuery();
                        DataTable tk = new DataTable();
                        MySqlDataAdapter kd = new MySqlDataAdapter(mcd);
                        int z = cd.Fill(tk);
                        MySqlDataReader dr = mcd.ExecuteReader();
                        if (dr.Read() == true && z>0)
                        {
                            String aux= dr["total"].ToString();
                            if (aux=="") {
                                aux = "0";
                            }
                            total.Text = "Total: $" + aux;
                            totalRecibo = totalRecibo + Convert.ToDouble(aux); 
                        }
                        sqlCOn.Close();

                        Topa.Text = "$ "+ Convert.ToString(totalRecibo);
                        hftp.Value = Convert.ToString(totalRecibo);
                    }
                }  
            }
        }
        protected void pagar_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
            {
                string id = "",tp="";
                id = hf.Value.ToString();
                tp = hftp.Value.ToString();
                if (!(forma.SelectedItem.Text == "Seleccione" || fecha.Text == "" || tp == "" || id==""))
                {
                    sqlCOn.Open();
                    MySqlCommand cmd = sqlCOn.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "UPDATE recibo SET formapago='"+forma.SelectedItem.Text+"',fecha='"+fecha.Text+"',total="+tp+" WHERE idcliente="+id;
                    cmd.ExecuteNonQuery();
                    sqlCOn.Close();

                    sqlCOn.Open();
                    MySqlCommand imd = sqlCOn.CreateCommand();
                    imd.CommandType = CommandType.Text;
                    imd.CommandText = "SELECT * FROM cliente ORDER WEHRE idcliente="+id;
                    imd.ExecuteNonQuery();
                    MySqlDataReader dc = imd.ExecuteReader();
                    int idhab = 0;
                    if (dc.Read() == true)
                    {
                        idhab = int.Parse(dc["idhabitacion"].ToString());
                    }
                    sqlCOn.Close();

                    sqlCOn.Open();
                    MySqlCommand hmd = sqlCOn.CreateCommand();
                    hmd.CommandType = CommandType.Text;
                    hmd.CommandText = "UPDATE habitacion SET estado=false WHERE idhabitacion=" + idhab;
                    hmd.ExecuteNonQuery();
                    sqlCOn.Close();

                    sqlCOn.Open();
                    MySqlCommand amd = sqlCOn.CreateCommand();
                    amd.CommandType = CommandType.Text;
                    amd.CommandText = "UPDATE cliente SET estadoc=false idhabitacion=null WHERE idcliente=" + id;
                    int i=amd.ExecuteNonQuery();
                    sqlCOn.Close();

                    sqlCOn.Open();
                    MySqlCommand ucd = sqlCOn.CreateCommand();
                    ucd.CommandType = CommandType.Text;
                    ucd.CommandText = "DELETE FROM usuario WHERE idcliente="+id;
                    ucd.ExecuteNonQuery();
                    sqlCOn.Close();

                    if (i>0) {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosCorrectos()", true);
                    }
                    else {
                        ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "datosIncorrectos()", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ramdomtext", "completeCampos()", true);
                }
            }
        }

        protected void cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaCliente.aspx");
        }
    }
}