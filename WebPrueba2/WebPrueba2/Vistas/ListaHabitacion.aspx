<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaHabitacion.aspx.cs" Inherits="WebPrueba2.Vistas.ListaHabitacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Habitaciones
    <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript">

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista de Habitacion
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form id="form" runat="server">
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"    >
                                    <Columns>   
                                        <asp:BoundField DataField="numhabitacion" HeaderText="Numero de Habitacion #" />
                                        <asp:BoundField DataField="estado" HeaderText="Estado" />
                                        <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate>                            
                                            <button class="btn btn-info"><a  class="fa fa-pencil" style="color:#0E0D0D;" href="EditarHabitac.aspx?id=<%# Eval("idhabitacion") %>" ></a></button>
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
