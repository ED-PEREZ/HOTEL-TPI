<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ReporteEmpleado.aspx.cs" Inherits="WebPrueba2.Vistas.Reportes.ReporteEmpleado1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    REPORTE EMPLEADOS
    <script src="../../vendor/jquery/jquery.js"></script>
    <script src="../../js/jspdf.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div id="bt">
            <input type="button" onclick="DescargarPDF('Reporte', 'ReporteEmpleados')" value="Decargar Reporte" />
        </div>
        <div id="Reporte">
            <center>
                <h1>REPORTE DE EMPLEADOS</h1>
            <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" class="table table-responsive table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="codigoemp" HeaderText="CODIGO" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="dui" HeaderText="DUI" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="nombre" HeaderText="NOMBRE" ItemStyle-Width="50%" />
                    <asp:BoundField DataField="cargo" HeaderText="CARGO" ItemStyle-Width="10%" />
                </Columns>
            </asp:GridView>
            </center>
        </div>


    </form>
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
<asp:Content ID="Content3" ContentPlaceHolderID="final" runat="server">
</asp:Content>
