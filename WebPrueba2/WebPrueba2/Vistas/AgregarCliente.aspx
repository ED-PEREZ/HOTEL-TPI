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
            document.location.href = 'AgregarCliente.aspx';
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
                                            <asp:TextBox ID="dui" runat="server" class="form-control" placeholder="02123442-9"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="codigo">Codigo (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="codigo" runat="server" class="form-control" placeholder="Ejemplo"></asp:TextBox>
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
                                            <asp:TextBox ID="cell" runat="server" class="form-control" placeholder="7755-0025"></asp:TextBox>
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
                                            <div class="col-xs-12 col-md-8">
                                                <asp:TextBox ID="fechaIn" CssClass="form-control" placeholder="dd/mm/yyyy" ReadOnly="true"  runat="server" />
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <asp:ImageButton ID="imagenIn" ImageUrl="../images/icono-calendario.png" OnClick="fechIn_Click" runat="server" Height="51px" Width="51px"/>
                                            </div> 
                                            <asp:Calendar ID="calendarIn" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="calendar_SelectionChanged">
                                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                                <OtherMonthDayStyle ForeColor="#999999" />
                                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                                <WeekendDayStyle BackColor="#CCCCFF" />
                                            </asp:Calendar>
                                        </div>
                                        <div class="form-group">
                                            <label for="salida">Fecha de Salida (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12 col-md-8">
                                                <asp:TextBox ID="fechaSa" CssClass="form-control" placeholder="dd/mm/yyyy" ReadOnly="true"  runat="server" />
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <asp:ImageButton ID="imagenSa" ImageUrl="../images/icono-calendario.png" OnClick="fechSa_Click" runat="server" Height="51px" Width="51px"/>
                                            </div> 
                                            <asp:Calendar ID="calendarSa" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="calendarSa_SelectionChanged">
                                                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                                <OtherMonthDayStyle ForeColor="#999999" />
                                                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                                <WeekendDayStyle BackColor="#CCCCFF" />
                                            </asp:Calendar>
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
