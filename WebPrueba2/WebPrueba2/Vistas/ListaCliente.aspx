<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaCliente.aspx.cs" Inherits="WebPrueba2.Vistas.ListaCliente" %>
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
                        document.getElementById("<%=algo.ClientID%>").value = "eliminar";
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
             setTimeout ("document.location.href = 'ListaCliente.aspx'",1500);
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
                    Lista de Clientes
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form id="form" runat="server">
                                <asp:TextBox ID="algo" runat="server" />
                                 <asp:TextBox ID="contenedor" runat="server" />
                                <asp:TextBox ID="ja" runat="server" />
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  >                                    
                                    <Columns>   
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="dui" HeaderText="DUI" />
                                        <asp:BoundField DataField="fechaentrada" DataFormatString="{0:d}"  HeaderText="Fecha de Reserva" />
                                        <asp:BoundField DataField="fechasalida" DataFormatString="{0:d}"  HeaderText="Fecha de Reserva" />
                                        <asp:BoundField DataField="correo" HeaderText="E-Mail" />
                                        <asp:BoundField DataField="celular" HeaderText="Celular" />
                                        <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Cancelar" CommandArgument='<%# Eval("idcliente") %>' CssClass="btn btn-primary btn-sm btn-primary" OnClick="Cancelar_Click" runat="server">
                                                <i class="ace-icon fa fa-credit-card bigger-120"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btMod" CommandArgument='<%# Eval("idcliente") %>' CssClass="btn btn-primary btn-sm btn-warning" OnClick="btMod_Click" runat="server">
                                                <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btEli" CommandArgument='<%# Eval("idcliente") %>' CssClass="btn btn-primary btn-sm btn-danger" OnClick="btEli_Click" runat="server">
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
