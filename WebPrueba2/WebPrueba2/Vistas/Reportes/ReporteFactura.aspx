<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteFactura.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteFactura" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FACTURA</title>
<link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="../../vendor/jquery/jquery.js"></script>
    <style type="text/css">
        .ftabla {
            font-family: 'Century Gothic', Courier, monospace;
            font-size: 12px;
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
     
    <div id="Reporte" class="Rows" style="width: 80%; font-family:'Century Gothic'" >
        <h1>FACTURA #
            <asp:Label id="rcod" runat="server" Text="FACTURA"/>
        </h1>
            <form class="form-horizontal" role="form" id="formE" name="formE">
                <table class="ftabla" style="width:100%">
                    <tbody class="ftabla">
                        <tr>
                            <td>
                                <label style="align-content:center" for="rfec">FECHA:</label>
                            </td>
                            <td>
                                <label style="align-content:center" for="rpag">FORMA DE PAGO:<br /></label>
                            </td>
                            <td>
                                <label style="align-content:center" for="rtot">TOTAL:<br /></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label style="align-content:center" id="rfec" runat="server" Text="PAGO DEL RECIBO"/>
                            </td>
                            <td>
                                <asp:Label style="align-content:center" id="rpag" runat="server" Text=" FROMA DE PAGO"/>
                            </td>
                            <td>
                                <asp:Label style="align-content:center" id="rtot" runat="server" Text="TOTAL DEL RECIBO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label  for="fent">FECHA DE RESERVACION:<br /></label>
                            </td>
                            <td>
                                <label  for="fsal">FECHA DEL SALIDA:<br /></label>
                            </td>
                            <td>
                                <label  for="fent">TOTAL DE DIAS:<br /></label>
                            </td>
                        </tr> 
                        <tr>
                            <td>
                                <asp:Label id="fent" runat="server" Text="FECHA DE RESERVACION"/>
                            </td>
                            <td>
                                 <asp:Label id="fsal" runat="server" Text="FECHA DE SALIDA"/>
                            </td>
                            <td>
                                 <asp:Label id="dias" runat="server" Text="DIAS"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label for="fent">TIPO DE HABITACION:</label>
                                <asp:Label id="thab" runat="server" Text="FECHA DE RESERVACION"/>
                            </td>
                            <td>
                                <label for="fent">TOTAL DE DIAS:</label>
                                <asp:Label id="tpre" runat="server" Text="FECHA DE RESERVACION"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <label style="width:30%" for="nomb">NOMBRE:</label>
                            </td>
                            <td colspan="2">
                                <asp:Label width="70%" id="nomb" runat="server" Text="NOMBRE DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="dui">DUI:</label>
                            </td>
                            <td colspan="2">
                                <asp:Label width="70%" id="dui" runat="server" Text="DUI DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="dir">REGION:</label>
                            </td>
                            <td colspan="2">
                                <asp:Label width="70%" id="dir" runat="server" Text="REGION DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="cor">CORREO:</label>
                            </td>
                            <td colspan="2">
                                <asp:Label width="70%" id="cor" runat="server" Text="CORREO DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="tel">TELEFONO:</label>
                            </td>
                            <td colspan="2">
                                <asp:Label width="70%" id="tel" runat="server" Text="TELEFONO DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="hab">HABITACION:</label>
                            </td>
                            <td colspan="2">
                                <asp:Label width="70%" id="hab" runat="server" Text="HABITACION RESERVADA"/>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </form>
        </div>
        <form id="formulario" name="formulario" method="post" action="">
        <div align="center">
            <input type="button" name="boton" id="boton" class="btn btn-primary btn-sm btn-success" value="Imprimir" onclick="ocultar()" />
            
            <input type="button" name="cerrar" id="cerrar" class="btn btn-primary btn-sm btn-warning" value="Cancelar" onclick="cerrar()" />
        </div>
    </form>
</body>
</html>