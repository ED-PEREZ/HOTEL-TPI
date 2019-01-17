﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportePedidos.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReportePedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
    <form id="form1" runat="server">
        <div id="Reporte" style="width:80%">
             <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  >                                    
                 <Columns>   
                     <asp:BoundField DataField="numhabitacion" HeaderText="# Habitacion del Cliente" />
                     <asp:BoundField DataField="nombre" HeaderText="Nombre del Cliente" />
                     <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                     <asp:TemplateField HeaderText="Foto">
                             <ItemTemplate>
                                     <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                             </ItemTemplate>
                    </asp:TemplateField>
              </Columns>
            </asp:GridView> 
        </div>
    </form>
        </center>
</body>
</html>