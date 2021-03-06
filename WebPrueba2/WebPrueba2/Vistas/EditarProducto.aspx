﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="EditarProducto.aspx.cs" Inherits="WebPrueba2.Vistas.EditarProducto" %>
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
                title: 'Datos Modificados correctos!!',
                showConfirmButton: false,
                timer: 1500
            });
         setTimeout ("document.location.href = 'ListaProducto.aspx';", 1500);          
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Editar Producto
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">

                                        <asp:HiddenField ID="hf" runat="server" />
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
                                            <asp:Button ID="boton2" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" OnClick="boton2_Click" />   
                                            <asp:Button ID="boton1" runat="server" class="btn btn-primary btn-lg btn-success"  Text="Guardar" OnClick="boton1_Click" />
                                        </div>                      

                               </div>
                            </div>
                        </div>

                    </div>
             </div>
       </div>      
</asp:Content>

