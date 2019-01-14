<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="EditarCatalogo.aspx.cs" Inherits="WebPrueba2.Vistas.EditarCatalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        Habitaciones
    <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript" >
        function completeCampos() {
            Swal({
                position: 'top-end',
                type: 'warning',
                title: 'Complete los campos!!',
                showConfirmButton: false,
                timer: 1500
            });
        }
        function datosIncorrectos() {
            Swal({
                position: 'top-end',
                type: 'error',
                title: 'Usuario y/o contraseña incorrectos!!',
                showConfirmButton: false,
                timer: 1500
            });
        }
        function datosCorrectos() {
            Swal({
                position: 'top-end',
                type: 'success',
                title: 'Datos correctos!!',
                showConfirmButton: false,
                timer: 5000
            });
             setTimeout ("document.location.href = 'ListaCatalogo.aspx'",1500);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Editar Catalogo
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form id="registrarCatalogo" role="form" runat="server">
                                        <asp:HiddenField ID="hf" runat="server" />
                                        <div class="form-group">
                                            <label for="detalle">Detalle (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="detalle" runat="server" class="form-control" placeholder="Camas"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="cantidad">Cantidad (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="cantidad" runat="server" class="form-control" placeholder="2"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <br>                                                        
                                            <asp:Button ID="cancelar" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" />   
                                            <asp:Button ID="agregar" runat="server" class="btn btn-primary btn-lg btn-success"  Text="Modificar" OnClick="agregar_Click" />
                                        </div>                     
                                    </form>
                               </div>
                            </div>
                        </div>

                    </div>
             </div>
       </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="final" runat="server">
</asp:Content>
