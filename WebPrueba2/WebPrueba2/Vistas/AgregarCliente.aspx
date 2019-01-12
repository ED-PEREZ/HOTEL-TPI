<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="AgregarCliente.aspx.cs" Inherits="WebPrueba2.Vistas.AgregarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Recepcion
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
             setTimeout ("document.location.href = 'AgregarCliente.aspx'",1500);
        }
        function formato(f) {
            if (f == 1) {
                var dui1 = document.getElementById("<%=dui.ClientID%>").value;
                if (dui1.length == 8 && !dui1.includes("-")) {
                    document.getElementById("<%=dui.ClientID%>").value = dui1 + "-";
                } else if (dui1.charAt(7) == '-' && dui1.length == 7) {
                    document.getElementById("<%=dui.ClientID%>").value = dui1.substring(0, 6);
                }
            } else if (f == 2) {
                var cel1 = document.getElementById("<%=cell.ClientID%>").value;
                if (cel1.length == 4) {
                    document.getElementById("<%=cell.ClientID%>").value = cel1 + "-";
                }
            }
        }
        function datosCorrectos() {
            Swal({
                position: 'top-end',
                type: 'success',
                title: 'Datos correctos!!',
                showConfirmButton: false,
                timer: 5000
            });
            setTimeout ("document.location.href = 'AgregarCliente.aspx';",1500);
        }
        function abrirVentana(){
        var url = "BuscarHabitacion.aspx";
        window.open(url, "Nuevo","alwaysRaised=no,toolbar=no,menubar=no,status=no,resizable=no,width=500,height=600,location=no");
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Cliente
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form id="registrarCliente" role="form" runat="server">
                                         <asp:HiddenField ID="idha" runat="server" />
                                        <div class="form-group">
                                            <label for="nombre">Nombre (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="nombre" runat="server" class="form-control" placeholder="Juan Perez"></asp:TextBox>
                                        </div>                                        
                                        <div class="form-group">
                                            <label for="dui">DUI (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="dui" runat="server" class="form-control" placeholder="02123442-9" oninput="formato(1);" maxlength="10"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="Usuario">Usuario (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="usuario" runat="server" class="form-control" placeholder="Ejemplo"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="correo">Correo (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="correo" runat="server" class="form-control" placeholder="ejemplo@gmail.com"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="cell">Celular (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="cell" runat="server" class="form-control" placeholder="7755-0025" oninput="formato(2);" maxlength="9"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="region">Region (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:DropDownList ID="region" class="form-control" runat="server">
                                                <asp:ListItem Enabled="true" Text="Seleccione" Value="0"></asp:ListItem>
                                                <asp:ListItem  Text="El Salvador" Value="El Salvador"></asp:ListItem>
                                                <asp:ListItem  Text="Guatemala" Value="Guatemala"></asp:ListItem>
                                                <asp:ListItem  Text="Honduras" Value="Honduras"></asp:ListItem>
                                                <asp:ListItem  Text="Costa Rica" Value="Costa Rica"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="habitacion">Habitacion (#)</label>
                                        </div>
                                        <div class="form-group">                                            
                                            <div class="col-xs-12 col-sm-6 col-md-8"> <asp:TextBox ID="habitacion" runat="server" class="form-control" placeholder="seleccione" ReadOnly="true"></asp:TextBox></div>
                                            <div class="col-xs-6 col-md-4"><button type="button" class="btn btn-primary btn-circle" onclick="abrirVentana()"><i class="fa fa-list"></i></button></div>                                                                                 
                                            <br>
                                            <br>
                                        </div>
                                        <div class="form-group">
                                            <label for="entrada">Fecha de Entrada (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox TextMode="Date" ID="fechaIn" autocomplete="off" runat="server" Cssclass="form-control" parent="dd-MM-yyyy" > </asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="salida">Fecha de Salida (*)</label>
                                        </div>
                                        <div class="form-group">
                                           <asp:TextBox TextMode="Date" ID="fechaSa" autocomplete="off" runat="server" Cssclass="form-control" parent="dd-MM-yyyy"> </asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                             <br>                                                       
                                            <asp:Button ID="cancelar" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" />   
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
