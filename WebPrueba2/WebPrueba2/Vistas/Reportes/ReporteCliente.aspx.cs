using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrueba2.Vistas.Reportes
{
    public partial class ReporteCliente : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection("server=localhost; database=hotel; Uid=root; pwd=; SslMode = none");
        int Valor = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["id"] != null)
            {
                this.Valor = int.Parse(Request.Params["id"]);
                string asc = Request.Params["id"];
                llenar(this.Valor);
            }
        }

        private void llenar(int valor)
        {
            this.Valor = valor;
            con.Open();
            MySqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT c.nombre as nombre, c.dui as dui, c.region as region, c.correo as correo, c.celular as celular, " +
                    "h.numhabitacion as habitacion, c.fechaentrada as fechaentrada, c.fechasalida as fechasalida FROM cliente as c INNER JOIN " +
                    "habitacion as h ON c.idhabitacion = h.idhabitacion where idcliente ='" + valor + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
            ds.Fill(dt);
            nomb.Text = dt.Rows[0][0].ToString();
            dui.Text = dt.Rows[0][1].ToString();
            dir.Text = dt.Rows[0][2].ToString();
            cor.Text = dt.Rows[0][3].ToString();
            tel.Text = dt.Rows[0][4].ToString();
            hab.Text = dt.Rows[0][5].ToString();
            fent.Text = Fecha(dt.Rows[0][6].ToString());
            fsal.Text = Fecha(dt.Rows[0][7].ToString());
            con.Close();
        }

        private string Fecha(string v)
        {
            string subs = v.Substring(0, 10);
            string[] sc = subs.Split('-');
            return (sc[2] + " DE " + mes(sc[1]) + " DEL " + sc[0]);
        }

        private string mes(string v)
        {
            string[] mes = { "", "ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE" };
            int i = Convert.ToInt32(v);
            return mes[i];
        }
    }
}