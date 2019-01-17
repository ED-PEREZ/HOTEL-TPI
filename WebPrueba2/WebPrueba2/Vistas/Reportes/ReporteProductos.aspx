﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteProductos.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REPORTE PRODUCTOS</title>
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
            document.formulario.cerrar.style.visibility = "visible";
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
            
            <input type="button" name="cerrar" id="cerrar" class="btn btn-primary btn-sm btn-warning" value="Cancelar" onclick="cerrar()" />
        </div>
    </form>
    <form id="form1" runat="server">
        <div id="Reporte" style="width:80%">
            <h1>REPORTE DE PRODUCTOS</h1>
            <asp:GridView ID="gvTipo" runat="server" AutoGenerateColumns="False" Width="50%">
                 <Columns>
                    <asp:BoundField DataField="descripcion" HeaderText="Tipo" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40%"/>
                    <asp:BoundField DataField="precio" HeaderText="Precio ($)" ItemStyle-Width="10%" />
                    <asp:TemplateField HeaderText="Foto" ItemStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>