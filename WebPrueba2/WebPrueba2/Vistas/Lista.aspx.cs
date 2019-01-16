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
    public partial class Lista : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session.Count != 0)
                {
                    String idc = "";
                    if (Session["USUARIO"].ToString() == "6")
                    {
                        idc = Session["CLIENTE"].ToString();
                        using (MySqlConnection sqlCOn = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none"))
                        {
                            sqlCOn.Open();
                            MySqlCommand smd = sqlCOn.CreateCommand();
                            smd.CommandType = CommandType.Text;
                            smd.CommandText = "SELECT a.idproducto, a.descripcion, a.precio, a.foto FROM producto a" +
                                " INNER JOIN servicio_cuarto b ON b.idproducto = a.idproducto " +
                                "INNER JOIN recibo c ON b.idrecibo = c.idrecibo WHERE b.estado=FALSE AND c.idcliente=" + idc;
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
                            cmd.CommandText = "SELECT a.idproducto, a.descripcion, a.precio, a.foto FROM producto a" +
                                " INNER JOIN servicio_cuarto b ON b.idproducto = a.idproducto " +
                                "INNER JOIN recibo c ON b.idrecibo = c.idrecibo WHERE b.estado=TRUE AND c.idcliente=" + idc;
                            cmd.ExecuteNonQuery();
                            DataTable dt = new DataTable();
                            MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
                            int j = ds.Fill(dt);
                            gvTipo.DataSource = dt;
                            gvTipo.DataBind();
                            if (j < 1)
                            {
                                valida.Text = "No ha recibido ningun pedido";
                            }
                            sqlCOn.Close();

                            sqlCOn.Open();
                            MySqlCommand mcd = sqlCOn.CreateCommand();
                            mcd.CommandType = CommandType.Text;
                            mcd.CommandText = "SELECT SUM(a.precio) total FROM producto a INNER JOIN servicio_cuarto b ON b.idproducto = a.idproducto INNER JOIN recibo c ON b.idrecibo = c.idrecibo WHERE b.estado=TRUE AND c.idcliente=13";
                            mcd.ExecuteNonQuery();
                            MySqlDataReader dr = mcd.ExecuteReader();
                            if (dr.Read() == true && j > 0)
                            {
                                total.Text = "Total: $" + dr["total"].ToString();
                            }

                            sqlCOn.Close();
                        }
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
            }
        }
    }
}