<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteClientes.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>REPORTE CLIENTES</title>
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
            <h1>REPORTE DE CLIENTES</h1>
        </div>
    </form>
</body>
</html>
