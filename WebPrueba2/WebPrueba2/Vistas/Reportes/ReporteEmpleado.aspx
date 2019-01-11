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
            margins = { top: 10, bottom: 20, left: 20, width: 600 };
            pdf.fromHTML(html, margins.left, margins.top, { 'width': margins.width }, function (dispose) { pdf.save(nombre + '.pdf'); }, margins);
        }
    </script>
</head>
<body >
    <center>
    <div id="bt" style="align-content: center">
        &nbsp;
        <input type="button" onclick="DescargarPDF('Reporte', 'ReporteEmpleado')" value="Decargar Reporte" />
      </div>
    <div id="Reporte" class="Rows" style="width: 80%; font-family: 'Century Gothic'">
        <div class="col-xs-12">
            <form class="form-horizontal" role="form" id="formE" name="formE">
                <div>
                    <h1><strong>EMPLEADO</strong></h1>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="idE">Id. Empleado</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="idE" runat="server" Text="ID. DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="cod">CODIGO:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="cod" runat="server" Text="CODIGO DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="nomb">NOMBRE:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="nomb" runat="server" Text="NOMBRE DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="sexo">SEXO:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="sexo" runat="server" Text="SEXO DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="fnac">FECHA DE NACIMIENTO:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="fnac" runat="server" Text="NACIMIENTO DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="dir">DIRECCION:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="dir" runat="server" Text="DIRECCION DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="tel">TELEFONO:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="tel" runat="server" Text="TELEFONO DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="dui">DUI:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="dui" runat="server" Text="DUI DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="nit">NIT:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="nit" runat="server" Text="NIT DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="seg">SEGURO SOCIAL:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="seg" runat="server" Text="SEGURO SOCIAL DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="afp">AFP:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="afp" runat="server" Text="AFP DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="fcon">FECHA DEL CONTRATO:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="fcon" runat="server" Text="FECHA DE CONTRATO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="carg">CARGO:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="carg" runat="server" Text="CARGO DEL EMPLEADO" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="suel">SUELDO DEL EMPLEADO:</label>
                    <div class="col-sm-9">
                        <asp:Label CssClass="col-xs-10 col-sm-5" ID="suel" runat="server" Text="SUELDO DEL EMPLEADO" />
                    </div>
                </div>
            </form>
        </div>
    </div>
         </center>
</body>
</html>
