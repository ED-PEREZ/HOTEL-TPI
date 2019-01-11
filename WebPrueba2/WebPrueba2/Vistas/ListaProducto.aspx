﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaProducto.aspx.cs" Inherits="WebPrueba2.Vistas.ListaProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Inventario y Pedidos  
    <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript">
        function completeCampos() {
            Swal({
                position: 'top-end',
                type: 'warning',
                title: 'Complete los campos!!',
                showConfirmButton: false,
                timer: 1500
            });
        }
        function eliminar(){
				swal({
					tittle: 'CONFIRME SI',
					text: "DESEA ELIMINAR EL REGISTRO?",
					type: 'info',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'SI, ELIMINAR'
				}).then((result) => {
					if (result.value) {
                       
					}
				})
       }
       function datosCorrectos() {
            Swal({
                position: 'top-end',
                type: 'success',
                title: 'Eliminacion completada!!',
                showConfirmButton: false,
                timer: 5000
            });
             setTimeout ("document.location.href = 'ListaProducto.aspx'",1500);
        }
       function datosIncorrectos() {
            Swal({
                position: 'top-end',
                type: 'error',
                title: 'No pudo eliminarse el registro!!',
                showConfirmButton: false,
                timer: 1500
            });
        }
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
                                        <asp:BoundField DataField="descripcion" HeaderText="Tipo" />
                                        <asp:BoundField DataField="precio" HeaderText="Precio" />
                                        <asp:TemplateField HeaderText="Foto">
                                            <ItemTemplate>
                                                <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate>    
                                            <asp:LinkButton ID="btMod" CommandArgument='<%# Eval("idproducto") %>' CssClass="btn btn-primary btn-sm btn-info" OnClick="btMod_Click" runat="server">
                                                <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btEli" CommandArgument='<%# Eval("idproducto") %>' CssClass="btn btn-primary btn-sm btn-warning" OnClick="btEli_Click" runat="server">
                                               <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </asp:LinkButton>
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
