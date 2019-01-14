<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportePorductos.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>REPORTE PRODUCTOS</title>
    <script src="../../vendor/jquery/jquery.js"></script>
    <link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="../../js/jspdf.js"></script>
    <script>
        function DescargarPDF(ContenidoID, nombre) {
            var pdf = new jsPDF('p', 'pt', 'letter');
            pdf.setFontSize(12);
            source = $('#' + ContenidoID)[0];
            specialElementHandlers = {
                '#bypassme': function (element, renderer) {
                    return true
                }
            };
            margins = {
                top: 30, bottom: 40, left: 40, rigth:40, width: 1300
            };

            pdf.fromHTML(
                source, margins.left, margins.top, {
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
            <input type="button" class="btn btn-primary btn-sm btn-success" onclick="DescargarPDF('Reporte', 'ReporteProductos')" value="Decargar Reporte" />
            <br/><br />
        </div>
        <div id="Reporte">
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
        </center>
</body>
</html>
