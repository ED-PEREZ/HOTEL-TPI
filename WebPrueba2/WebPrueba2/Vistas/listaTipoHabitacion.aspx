﻿<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="listaTipoHabitacion.aspx.cs" Inherits="WebPrueba2.Vistas.listaTipoHabitacion" %>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    Habitaciones
    <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript">
         function abrirVentana(id){
        var url = id;
            window.open(url, "Nuevo", "alwaysRaised=no,toolbar=no,menubar=no,status=no,"+
                "resizable = no, width = 800, height = 400, location = no");           
        }
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
             setTimeout ("document.location.href = 'listaTipoHabitacion.aspx'",1500);
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

<asp:Content ID="con2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Lista de Tipos de Habitacion
                            <div class="left">
                        <asp:LinkButton ID="btRep" ToolTip="REPORTE" CssClass="btn btn-primary btn-sm btn-success" OnClick="btRep_Click" runat="server">
                               <i class="ace-icon fa fa-file-pdf-o bigger-120">IMPRIMIR</i>
                        </asp:LinkButton>
                     </div>
                        </div>
                        <div class="panel-body">
          

                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"    >
                                <Columns>
                                   <asp:BoundField DataField="tipohabitacion" HeaderText="Tipo" />
                                   <asp:BoundField DataField="precio" HeaderText="Precio" />
                                    <asp:TemplateField HeaderText="Foto">
                                        <ItemTemplate>
                                            <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="20%">
                                        <ItemTemplate> 
                                            <asp:LinkButton ID="insertar" CommandArgument='<%# Eval("idtipohabitacion") %>' CssClass="btn btn-primary btn-sm btn-primary" OnClick="insertar_Click" runat="server">
                                               <i class="ace-icon fa fa-eye bigger-120"></i>
                                            </asp:LinkButton>   
                                            <asp:LinkButton ID="btMod" CommandArgument='<%# Eval("idtipohabitacion") %>' CssClass="btn btn-primary btn-sm btn-warning" OnClick="btMod_Click" runat="server">
                                               <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                            </asp:LinkButton>   
                                            <asp:LinkButton ID="btEli" CommandArgument='<%# Eval("idtipohabitacion") %>' CssClass="btn btn-primary btn-sm btn-danger" OnClick="btEli_Click" runat="server">
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


