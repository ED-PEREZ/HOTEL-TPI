<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaReserva.aspx.cs" Inherits="WebPrueba2.Vistas.ListaReserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Inventario y Pedidos  
    <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista del Inventario
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form id="form" runat="server">
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"    >
                                    <Columns>   
                                        <asp:BoundField DataField="codigo" HeaderText="Codigo" />
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                       <asp:BoundField DataField="fechareserva" DataFormatString="{0:d}"  HeaderText="Fecha de Reserva" />
                                    </Columns>
                                 </asp:GridView> 
                            </form>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
    </div> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="final" runat="server">
     <script>
    $(document).ready(function() {
        $("#<%=gvTipo.ClientID %>").DataTable({
            responsive: true
        });
    });
    </script>
</asp:Content>
