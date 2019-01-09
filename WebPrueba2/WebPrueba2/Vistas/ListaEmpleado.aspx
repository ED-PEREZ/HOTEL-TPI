<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaEmpleado.aspx.cs" Inherits="WebPrueba2.Vistas.ListaEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    EMPLEADOS
    <script type="text/javascript">
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
                        Eliminar_Conf();
					}
				})
			}

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField runat="server" ID="idEmpleado" />
            <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" class="table table-responsive table-bordered table-hover">

                <Columns>
                    <asp:BoundField DataField="codigoemp" HeaderText="CODIGO" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="dui" HeaderText="DUI" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="nombre" HeaderText="NOMBRE" ItemStyle-Width="50%" />
                    <asp:BoundField DataField="cargo" HeaderText="CARGO" ItemStyle-Width="10%" />
                    <asp:TemplateField ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:LinkButton ID="btMod" CommandArgument='<%# Eval("idEmpleado") %>' CssClass="btn btn-primary btn-sm btn-info" OnClick="Editar_Click" runat="server">
                               <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                            </asp:LinkButton>
                            </nav>
                            <asp:LinkButton ID="btEli" CommandArgument='<%# Eval("idEmpleado") %>' CssClass="btn btn-primary btn-sm btn-warning" OnClick="Eliminar_Click" runat="server">
                               <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
