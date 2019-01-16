<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaEmpleado.aspx.cs" Inherits="WebPrueba2.Vistas.ListaEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    EMPLEADOS
    <script type="text/javascript">
        function abrirVentana(id){
        var url = "Reportes/ReporteEmpleado.aspx?id="+id;
            window.open(url, "Nuevo", "alwaysRaised=no,toolbar=no,menubar=no,status=no,resizable=no,width=500,height=600,location=no");           
        }
        function eliminar() {
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
                    Eliminar_Conf();
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
             setTimeout ("document.location.href = 'ListaEmpleado.aspx'",1500);
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
                    Lista de Empleados
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">

                                <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover">

                                    <Columns>
                                        <asp:BoundField DataField="codigoemp" HeaderText="CODIGO" ItemStyle-Width="10%" />
                                        <asp:BoundField DataField="dui" HeaderText="DUI" ItemStyle-Width="10%" />
                                        <asp:BoundField DataField="nombre" HeaderText="NOMBRE" ItemStyle-Width="50%" />
                                        <asp:BoundField DataField="cargo" HeaderText="CARGO" ItemStyle-Width="10%" />
                                        <asp:TemplateField ItemStyle-Width="15%" HeaderText="ACCIONES">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btRep" target="_blank"  CommandArgument='<%# Eval("idEmpleado") %>' ToolTip="REPORTE" CssClass="btn btn-primary btn-sm btn-success" OnClick="Reporte_Click" runat="server">
                               <i class="ace-icon fa fa-file-pdf-o bigger-120"></i>
                                                </asp:LinkButton>
                                                </nav>
                            <asp:LinkButton ID="btMod" CommandArgument='<%# Eval("idEmpleado") %>' ToolTip="MODIFICAR" CssClass="btn btn-primary btn-sm btn-warning" OnClick="Editar_Click" runat="server">
                               <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                            </asp:LinkButton>
                                                </nav>
                            <asp:LinkButton ID="btEli" CommandArgument='<%# Eval("idEmpleado") %>' ToolTip="ELIMINAR" CssClass="btn btn-primary btn-sm btn-danger" OnClick="Eliminar_Click" runat="server">
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
        $("#<%=gvEmpleados.ClientID %>").DataTable({
            responsive: true
        });
    });
    </script>
</asp:Content>