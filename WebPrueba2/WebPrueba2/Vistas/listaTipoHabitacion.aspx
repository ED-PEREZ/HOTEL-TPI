<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="listaTipoHabitacion.aspx.cs" Inherits="WebPrueba2.Vistas.listaTipoHabitacion" %>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    Habitaciones
    <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript">

    </script>
</asp:Content>

<asp:Content ID="con2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Lista de Tipos de Habitacion
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12"> 
    <form id="form" runat="server">
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"    >
                                <Columns>
                                   <asp:BoundField DataField="tipohabitacion" HeaderText="Tipo" />
                                   <asp:BoundField DataField="precio" HeaderText="Precio" />
                                    <asp:TemplateField HeaderText="Foto">
                                        <ItemTemplate>
                                            <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate>                            
                                            <button class="btn btn-info"><a  class="fa fa-pencil" style="color:#0E0D0D;" href="EditarTipoHabitacion.aspx?id=<%# Eval("idtipohabitacion") %>" ></a></button>
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

<asp:Content ID="scrip" ContentPlaceHolderID="final" runat="server">
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $("#<%=gvTipo.ClientID %>").DataTable({
            responsive: true
        });
    });
    </script>
</asp:Content>


