<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteHabitaciones.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteHabitaciones1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>REPORTE DE HABITACIONES</title>
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
            print();
            document.formulario.boton.style.visibility = "visible";
        }
    </script>
</head>
<body>
    <center>
     <form id="formulario" name="formulario" method="post" action="">
        <div align="center">
            <input type="button" name="boton" id="boton" class="btn btn-primary btn-sm btn-success" value="Imprimir" onclick="ocultar()" />
        </div>
    </form>
    <form id="form1" runat="server">
        <div id="Reporte" style="width:80%">
            <h1>REPORTE DE HABITACIONES</h1>
            <asp:GridView ID="gvTipo" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="tipohabitacion" HeaderText="Tipo" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="30%" ItemStyle-CssClass="ftabla" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="30%" ItemStyle-CssClass="ftabla"/>
                    <asp:TemplateField HeaderText="Foto" HeaderStyle-CssClass="titulotabla" ItemStyle-Width="40%" ItemStyle-CssClass="ftabla">
                        <ItemTemplate>
                            <asp:Image ID="imagen" runat="server" Width="50px" Height="50px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
