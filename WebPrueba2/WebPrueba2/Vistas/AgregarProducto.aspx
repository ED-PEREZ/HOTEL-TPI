<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="WebPrueba2.Vistas.AgregarProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Inventario y Pedidos  
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
            document.location.href = 'AgregarCatalogo.aspx';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Producto
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form id="registrarProducto" role="form" runat="server">
                                        <div class="form-group">
                                            <label for="descripcion">Descripcion (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="descripcion" runat="server" class="form-control" placeholder="Pollo campero"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="precio">Precio ($)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="precio" runat="server" class="form-control" placeholder="200.00"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="foto">Foto (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:FileUpload ID="foto" runat="server" class="form-control"></asp:FileUpload>
                                        </div>
                                        <div class="form-group">
                                            <br>                                                        
                                            <asp:Button ID="boton2" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" />   
                                            <asp:Button ID="boton1" runat="server" class="btn btn-primary btn-lg btn-success"  Text="Guardar" OnClick="boton1_Click" />
                                        </div>
                                        
                                            
                                      
                                    </form>
                               </div>
                            </div>
                        </div>

                    </div>
             </div>
       </div>              
</asp:Content>
