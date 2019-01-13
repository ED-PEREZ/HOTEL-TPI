<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaEmpleado.aspx.cs" Inherits="WebPrueba2.Vistas.ListaEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    EMPLEADOS
    <script type="text/javascript">
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
                            <form id="form" runat="server">
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
        $("#<%=gvEmpleados.ClientID %>").DataTable({
            responsive: true
        });
    });
    </script>
</asp:Content>