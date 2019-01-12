using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebPrueba2.Vistas
{
    public partial class Menu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.SessionID == "") {
                Response.Redirect("Login.aspx");
            }
        }

        protected void CerrarSesion(object sender, EventArgs e)
        {
            Session.Remove("USUARIO");
            Response.Redirect("Login.aspx");
        }
    }
}