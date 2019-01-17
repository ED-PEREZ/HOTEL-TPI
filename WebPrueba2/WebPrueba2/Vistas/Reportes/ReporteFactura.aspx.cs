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
    public partial class ReporteFactura : System.Web.UI.Page
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
            DataTable dt = new DataTable();
            cmd.CommandText = "SELECT c.nombre  , c.dui , c.region , c.correo, c.celular,h.numhabitacion , c.fechaentrada, c.fechasalida ,r.codigo , r.formapago , r.fecha , r.total , t.tipohabitacion, t.precio, if((fechasalida-fechaentrada<=0),1,fechasalida-fechaentrada) as dias FROM cliente AS c INNER JOIN habitacion AS h ON c.idhabitacion = h.idhabitacion INNER JOIN recibo AS r ON r.idcliente = c.idcliente INNER JOIN tipo_habitacion as t ON h.idtipohabitacion = t.idtipohabitacion where r.idrecibo =" + valor;
            cmd.ExecuteNonQuery();
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
            rcod.Text = dt.Rows[0][8].ToString();
            rpag.Text = dt.Rows[0][9].ToString();
            rfec.Text = Fecha(dt.Rows[0][10].ToString());
            rtot.Text = dt.Rows[0][11].ToString();
            thab.Text = dt.Rows[0][12].ToString();
            tpre.Text = dt.Rows[0][13].ToString();
            dias.Text = dt.Rows[0][14].ToString();
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