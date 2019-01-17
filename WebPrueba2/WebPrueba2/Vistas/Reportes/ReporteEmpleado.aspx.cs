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
    public partial class ReporteEmpleado : System.Web.UI.Page
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
            cmd.CommandText = "SELECT idempleado, codigoemp, nombre, sexo, fechanacimiento, " +
                "direccion, dui, nit, nseguro, nafp, telefono, fechacontrato, IF(cargo = 1, 'ADMINISTRADOR'," +
                "IF(cargo = 2, 'GERENTE', IF(cargo = 3, 'RECEPCIONISTA', " +
                "IF(cargo=4,'RECEPCIONISTA',IF(empleado.cargo = 5, 'CAMARERO','OTRO'))))) " +
                    "AS cargo, sueldo FROM empleado where idempleado ='" + valor + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter ds = new MySqlDataAdapter(cmd);
            ds.Fill(dt);
            idE.Text = dt.Rows[0][0].ToString();
            cod.Text = dt.Rows[0][1].ToString();
            nomb.Text = dt.Rows[0][2].ToString();
            sexo.Text = dt.Rows[0][3].ToString();
            fnac.Text = Fecha(dt.Rows[0][4].ToString());
            dir.Text = dt.Rows[0][5].ToString();
            dui.Text = dt.Rows[0][6].ToString();
            nit.Text = dt.Rows[0][7].ToString();
            seg.Text = dt.Rows[0][8].ToString();
            afp.Text = dt.Rows[0][9].ToString();
            tel.Text = dt.Rows[0][10].ToString();
            fcon.Text = Fecha(dt.Rows[0][11].ToString());
            carg.Text = dt.Rows[0][12].ToString();
            suel.Text = dt.Rows[0][13].ToString();
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