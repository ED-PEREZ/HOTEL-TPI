<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteCliente.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>REPORTE CLIENTE</title>
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
        <h1>REPORTE DE CLIENTE</h1>
            <form class="form-horizontal" role="form" id="formE" name="formE">
                <table class="ftabla" style="width:100%">
                    <tbody>
                        <tr>
                            <td>
                                 <label style="width:30%" for="nomb">NOMBRE:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="nomb" runat="server" Text="NOMBRE DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="dui">DUI:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="dui" runat="server" Text="DUI DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="dir">REGION:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="dir" runat="server" Text="REGION DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="cor">CORREO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="cor" runat="server" Text="CORREO DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="tel">TELEFONO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="tel" runat="server" Text="TELEFONO DEL CLIENTE"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="hab">HABITACION:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="hab" runat="server" Text="HABITACION RESERVADA"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="fent">FECHA DE RESERVACION:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="fent" runat="server" Text="FECHA DE RESERVACION"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="fsal">FECHA DEL SALIDA:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="fsal" runat="server" Text="FECHA DE SALIDA"/>
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
