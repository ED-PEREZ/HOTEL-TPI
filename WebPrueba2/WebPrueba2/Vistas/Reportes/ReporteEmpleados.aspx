<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteEmpleados.aspx.cs" Inherits="WebPrueba2.Vistas.ReporteEmpleados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REPORTE DE EMPLEADOS</title>

    <link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="../../vendor/jquery/jquery.js"></script>
    <style type="text/css">
        .ftabla {
            font-family: 'Century Gothic', Courier, monospace;
            font-size: 13px;
        }
    </style>
    <style type="text/css">
        .titulotabla {
            font-family: Century,Helvetica, Arial, sans-serif;
            font-size: 14px;
        }
    </style>
    <script type="text/javascript">
        function ocultar() {
            document.formulario.boton.style.visibility = "hidden";
            document.formulario.cerrar.style.visibility = "hidden";
            print();
            document.formulario.boton.style.visibility = "visible";
        }

        function cerrar() {
            window.close();
        }
    </script>
</head>
<body>
    <center>
     <form id="formulario" name="formulario" method="post" action="">
        <div align="center">
            <input type="button" name="boton" id="boton" class="btn btn-primary btn-sm btn-success" value="Imprimir" onclick="ocultar()" />
            
            <input type="button" style="visibility:hidden" name="cerrar" id="cerrar" class="btn btn-primary btn-sm btn-warning" value="Cancelar" onclick="cerrar()" />
        </div>
    </form>
    <form id="form1" runat="server" style="border:medium">
        <div id="Reporte" style="width:80%">
            <h1>REPORTE DE EMPLEADOS</h1>
            <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" Width="100%">
                <Columns>
                    <asp:BoundField DataField="codigoemp" HeaderText="CODIGO" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="5%" ItemStyle-CssClass="ftabla" />
                    <asp:BoundField DataField="nombre" HeaderText="NOMBRE" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="30%" ItemStyle-CssClass="ftabla"/>
                    <asp:BoundField DataField="dui" HeaderText="DUI" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="10%" ItemStyle-CssClass="ftabla"/>
                    <asp:BoundField DataField="nit" HeaderText="NIT" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="20%" ItemStyle-CssClass="ftabla"/>
                    <asp:BoundField DataField="cargo" HeaderText="CARGO" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="15%" ItemStyle-CssClass="ftabla"/>
                </Columns>
            </asp:GridView>
           
        </div>
    </form>
        </center>
</body>

</html>
