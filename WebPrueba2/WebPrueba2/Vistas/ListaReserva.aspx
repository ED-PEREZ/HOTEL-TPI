<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaReserva.aspx.cs" Inherits="WebPrueba2.Vistas.ListaReserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Recepcion  
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
             setTimeout ("document.location.href = 'ListaReserva.aspx'",1500);
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
                    Lista de Reserva
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 

                                <asp:Label ID="ver" runat="server" Text=""/>
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"    >
                                    <Columns>   
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="fechareserva" HeaderText="Fecha de Reserva" />
                                        <asp:TemplateField ItemStyle-Width="20%" HeaderText="Opciones">
                                            <ItemTemplate>
                                            <asp:LinkButton ID="agregarc" CommandArgument='<%# Eval("idreserva") %>' CssClass="btn btn-primary btn-sm btn-primary" OnClick="agregarc_Click" runat="server">
                                               <i class="ace-icon fa fa-sign-out  bigger-120"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btMod" CommandArgument='<%# Eval("idreserva") %>' CssClass="btn btn-primary btn-sm btn-info" OnClick="btMod_Click" runat="server">
                                               <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btEli" CommandArgument='<%# Eval("idreserva") %>' CssClass="btn btn-primary btn-sm btn-warning" OnClick="btEli_Click" runat="server">
                                               <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                 </asp:GridView> 

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
