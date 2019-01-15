<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="AgregarReserva.aspx.cs" Inherits="WebPrueba2.Vistas.AgregarReserva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Recepcion
     <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript" >
        function fecha() {
            Swal({
                position: 'top-end',
                type: 'warning',
                title: 'Debe de ingresar una fecha valida',
                showConfirmButton: false,
                timer: 1500
            });
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
             setTimeout ("document.location.href = 'AgregarReserva.aspx'",1500);
        }
         function abrirVentana(){
        var url = "BuscarHabitacion.aspx";
        window.open(url, "Nuevo","alwaysRaised=no,toolbar=no,menubar=no,status=no,resizable=no,width=500,height=300,location=no");
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">      
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Reserva
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form id="registrarReserva" role="form" runat="server">
                                        <asp:HiddenField ID="idha" runat="server" />
                                        <asp:HiddenField ID="ha" runat="server" />
                                        <div class="form-group">
                                            <label for="nombre">Nombre (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="nombre" runat="server" class="form-control" placeholder="Juan Perez"></asp:TextBox>
                                        </div>                                        
                                        <div class="form-group">
                                            <label for="adelanto">Adelanto ($)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="adelanto" runat="server" class="form-control" placeholder="360.00"></asp:TextBox>
                                        </div>
                                         <div class="form-group">
                                            <label for="habitacion">Habitacion (#)</label>
                                        </div>
                                        <div class="form-group">                                            
                                            <div class="col-xs-12 col-sm-6 col-md-8">
                                              <div>
                                               <input type="text" id="numha" name="ha" class="form-control" placeholder="Seleccione" readonly runat="server" />
                                            </div>
                                            </div>
                                            <div class="col-xs-6 col-md-4"><button type="button" class="btn btn-primary btn-circle" onclick="abrirVentana()"><i class="fa fa-list"></i></button></div>                                                                                 
                                            <br>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <label for="entrada">Fecha de Entrada (*)</label>
                                        </div>
                                        <div class="form-group">
                                          <asp:TextBox TextMode="Date" ID="fecha" autocomplete="off" runat="server" Cssclass="form-control" min="2001-01-01" max="Date" parent="dd-MM-yyyy"> </asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <br>                                                        
                                            <asp:Button ID="cancelar" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" OnClick="cancelar_Click" />   
                                            <asp:Button ID="agregar" runat="server" class="btn btn-primary btn-lg btn-success"  Text="Guardar" OnClick="agregar_Click" />
                                        </div>                     
                                    </form>
                               </div>
                            </div>
                        </div>

                    </div>
             </div>
    </div> 
</asp:Content>
