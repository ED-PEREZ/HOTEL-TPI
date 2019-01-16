<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ReporteHabitacione.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteHabitaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    REPORTE HABITACIONES
    <script src="../../vendor/jquery/jquery.js"></script>
    <script src="../../js/jspdf.js"></script>
    <script>
        function DescargarPDF(ContenidoID, nombre) {
            var pdf = new jsPDF('p', 'pt', 'letter');
            pdf.page = 1;
            html = $('#' + ContenidoID).html();
            specialElementHandlers = {};
            margins = { top: 10, bottom: 20, left: 20, width: 600 };
            pdf.fromHTML(html, margins.left, margins.top, { 'width': margins.width }, function (dispose) { pdf.save(nombre + '.pdf'); }, margins);

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div id="bt">
            <input type="button" onclick="DescargarPDF('Reporte', 'ReporteHabitaciones')" value="Decargar Reporte" />
        </div>
        <div id="Reporte">
            <asp:GridView ID="gvTipo" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="tipohabitacion" HeaderText="Tipo" />
                    <asp:BoundField DataField="precio" HeaderText="Precio" />
                    <asp:TemplateField HeaderText="Foto">
                        <ItemTemplate>
                            <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="final" runat="server">
</asp:Content>
