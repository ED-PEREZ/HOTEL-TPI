<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteEmpleado.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteEmpleado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REPORTE EMPLEADO</title>
    <link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="../../vendor/bootstrap/js/bootstrap.js"></script>
    <script src="../../vendor/jquery/jquery.js"></script>
    <script src="../../js/jspdf.min.js"></script>
    <script>
        function DescargarPDF(ContenidoID, nombre) {
            var pdf = new jsPDF('p', 'mm', 'letter');
            pdf.page = 1;
            html = $('#' + ContenidoID).html();
            pdf.setFont("Century-Gothic", "Normal");
            margins = { top: 10, bottom: 20, left: 20, width: 600 };
            pdf.fromHTML(html, margins.left, margins.top, { 'width': margins.width }, function (dispose) { pdf.save(nombre + '.pdf'); }, margins);

        }
    </script>
</head>
<body>
    <div id="bt">
        <input type="button" onclick="DescargarPDF('Reporte', 'ReporteEmpleado')" value="Decargar Reporte" />
    </div>
    <div id="Reporte" class="Rows" style="width: 80%; font-family:'Century Gothic'" >
        <div class="col-xs-12">
            <form class="form-horizontal" role="form" id="formE" name="formE">
                <table style="border:0px;font-family:'Century Gothic'">
                    <thead>EMPLEADO</thead>
                    <tbody>
                        <tr>
                        <td>
                           <label  for="idE" style="width:30;height:20px" >Id. Empleado</label>
                        </td>
                            <td>
                                <asp:Label width="70%" height="20px" id="idE" runat="server" Text="ID. DEL EMPLEADO" style="margin-left: 98px"/>
                            </td>
                       </tr>
                        <tr>
                            <td>
                                <label style="width:30" for="cod">CODIGO:</label>
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
                                <asp:Label width="60%" id="nomb" runat="server" Text="NOMBRE DEL EMPLEADO"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label style="width:30" for="sexo">SEXO:</label>
                            </td>
                            <td>
                                <asp:Label width="60%" id="sexo" runat="server" Text="SEXO DEL EMPLEADO"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div><h1></h1></div>
                <div class="form-group">
                    
                    	<div class="col-sm-9">
							
						</div>
                 </div>
                <div class="form-group">
                    
                    	<div class="col-sm-9">
							
						</div>
                 </div>
                <div class="form-group">
                   
                    	<div class="col-sm-9">
							
						</div>
                 </div>
                <div class="form-group">
                    
                    	<div class="col-sm-9">
							
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="fnac">FECHA DE NACIMIENTO:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="fnac" runat="server" Text="NACIMIENTO DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="dir">DIRECCION:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="dir" runat="server" Text="DIRECCION DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="tel">TELEFONO:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="tel" runat="server" Text="TELEFONO DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="dui">DUI:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="dui" runat="server" Text="DUI DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="nit">NIT:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="nit" runat="server" Text="NIT DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="seg">SEGURO SOCIAL:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="seg" runat="server" Text="SEGURO SOCIAL DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="afp">AFP:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="afp" runat="server" Text="AFP DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="fcon">FECHA DEL CONTRATO:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="fcon" runat="server" Text="FECHA DE CONTRATO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="carg">CARGO:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="carg" runat="server" Text="CARGO DEL EMPLEADO"/>
						</div>
                 </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="suel">SUELDO DEL EMPLEADO:</label>
                    	<div class="col-sm-9">
							<asp:Label  cssClass="col-xs-10 col-sm-5" id="suel" runat="server" Text="SUELDO DEL EMPLEADO"/>
						</div>
                 </div>
            </form>
        </div>
    </div>
</body>
</html>
