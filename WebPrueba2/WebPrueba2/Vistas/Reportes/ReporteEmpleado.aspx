<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteEmpleado.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteEmpleado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
            document.formulario.cerrar.style.visibility = "hidden";
            print();
            document.formulario.boton.style.visibility = "visible";
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
            
            <input type="button" name="cerrar" id="cerrar" class="btn btn-primary btn-sm btn-warning" value="Cancelar" onclick="cerrar()" />
        </div>
    </form>
    <div id="Reporte" class="Rows" style="width: 80%; font-family:'Century Gothic'" >
        <div class="col-xs-12">
            <form class="form-horizontal" role="form" id="formE" name="formE">
                <table class="ftabla" style="width:100%">
                    <thead class="titulotabla">EMPLEADO</thead>
                    <tbody>
                        <tr>
                        <td>
                           <label  for="idE" style="width:30%" >Id. Empleado</label>
                        </td>
                            <td>
                                <asp:Label width="70%" id="idE" runat="server" Text="ID. DEL EMPLEADO" />
                            </td>
                       </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="cod">CODIGO:</label>
                            </td>
                            <td>
                                <asp:Label  width="70%" id="cod" runat="server" Text="CODIGO DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <label style="width:30%" for="nomb">NOMBRE:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="nomb" runat="server" Text="NOMBRE DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="sexo">SEXO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="sexo" runat="server" Text="SEXO DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="fnac">FECHA DE NACIMIENTO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="fnac" runat="server" Text="NACIMIENTO DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="dir">DIRECCION:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="dir" runat="server" Text="DIRECCION DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="tel">TELEFONO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="tel" runat="server" Text="TELEFONO DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="dui">DUI:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="dui" runat="server" Text="DUI DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="nit">NIT:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="nit" runat="server" Text="NIT DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="seg">SEGURO SOCIAL:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="seg" runat="server" Text="SEGURO SOCIAL DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="afp">AFP:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="afp" runat="server" Text="AFP DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="fcon">FECHA DEL CONTRATO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="fcon" runat="server" Text="FECHA DE CONTRATO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="carg">CARGO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="carg" runat="server" Text="CARGO DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30%" for="suel">SUELDO:</label>
                            </td>
                            <td>
                                <asp:Label width="70%" id="suel" runat="server" Text="SUE DEL EMPLEADO"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
