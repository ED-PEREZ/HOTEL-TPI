<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="EditarHabitac.aspx.cs" Inherits="WebPrueba2.Vistas.EditarHabitac" %>
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
                title: 'Datos Modificados correctos!!',
                showConfirmButton: false,
                timer: 1500
            });
         setTimeout ("document.location.href = 'ListaHabitacion.aspx';", 1500);      
        }
        function abrirVentana(){
        var url = "BuscarTipo.aspx";
        window.open(url, "Nuevo","alwaysRaised=no,toolbar=no,menubar=no,status=no,resizable=no,width=400,height=300,location=no");
      }
    </script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Habitacion
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    

                                        <asp:HiddenField ID="hf" runat="server" />
                                        <asp:HiddenField ID="idth" runat="server" />
                                        <div class="form-group">
                                            <label for="nombre">Numero de Habitacion (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="numero" runat="server" class="form-control" placeholder="####"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="tipo">Tipo de Habitacion (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-6 col-md-8">  
                                            <asp:TextBox ID="tipo" runat="server" class="form-control" placeholder="seleccione" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle" onclick="abrirVentana()"><i class="fa fa-list"></i></button>
                                            </div>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="idtipoh" runat="server" class="form-control"></asp:TextBox>
                                        </div>    
                                        <div class="form-group">
                                            <br>                                                        
                                            <asp:Button ID="cancelar" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" OnClick="cancelar_Click" />   
                                            <asp:Button ID="agregar"  runat="server" class="btn btn-primary btn-lg btn-success"  Text="Modificar" OnClick="agregar_Click" />
                                        </div>

                               </div>
                            </div>
                        </div>

                    </div>
             </div>
       </div>                         
</asp:Content>
