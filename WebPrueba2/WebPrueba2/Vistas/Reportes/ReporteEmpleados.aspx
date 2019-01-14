<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteEmpleados.aspx.cs" Inherits="WebPrueba2.Vistas.ReporteEmpleados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REPORTE DE EMPLEADOS</title>
    
    <link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="../../vendor/jquery/jquery.js"></script>
    <script src="../../js/jspdf.js"></script>
    <script>
         function DescargarPDF(ContenidoID, nombre) {
            var pdf = new jsPDF('p', 'pt', 'letter');
            source = $('#' + ContenidoID)[0];
            specialElementHandlers = {
                '#bypassme': function (element, renderer) {
                    return true
                }
            };
             margins = {
                 top: 30, bottom: 30, left: 30, rigth: 30, width: 2000
            };

            pdf.fromHTML(
                source, margins.left, margins.top, { 'width': margins.width,
                    'elementHandlers': specialElementHandlers
                },

                function (dispose) {

                    pdf.save(nombre + '.pdf');
                }
                , margins);
        }
    </script>
</head>
<body>
    <center>
    <form id="form1" runat="server">
        <div id="bt">
            <input type="button" class="btn btn-primary btn-sm btn-success" onclick="DescargarPDF('Reporte', 'ReporteEmpleados')" value="Decargar Reporte" />
        </div>
        <div id="Reporte" style="width:80%">
            
                <h1><center>REPORTE DE EMPLEADOS</center></h1>
            <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" Width="100%">
                <Columns>
                    <asp:BoundField DataField="codigoemp" HeaderText="CODIGO" ItemStyle-Width="5%" />
                    <asp:BoundField DataField="nombre" HeaderText="NOMBRE" ItemStyle-Width="37%" />
                    <asp:BoundField DataField="dui" HeaderText="DUI" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="nit" HeaderText="NIT" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="nafp" HeaderText="AFP" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="nseguro" HeaderText="SEGURO" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="cargo" HeaderText="CARGO" ItemStyle-Width="13%" />
                </Columns>
            </asp:GridView>
           
        </div>
    </form>
        </center>
</body>

</html>
