<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaFactura.aspx.cs" Inherits="WebPrueba2.Vistas.ListaFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Recepcion

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista de Facturas 
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form id="form" runat="server">
                                <asp:Label ID="ver" runat="server" Text=""></asp:Label>
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  >                                    
                                    <Columns>   
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="dui" HeaderText="DUI" />
                                        <asp:BoundField DataField="total" HeaderText="E-Mail" />
                                        <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate>
                                           
                                        </ItemTemplate>
                                        </asp:TemplateField>
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
