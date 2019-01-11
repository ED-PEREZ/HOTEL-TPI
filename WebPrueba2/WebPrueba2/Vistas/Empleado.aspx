<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="Empleado.aspx.cs" Inherits="WebPrueba2.Vistas.AgregarEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    EMPLEADOS
    <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript">
        function completeCampos(frase) {
            Swal({
                position: 'top-end',
                type: 'error',
                title: frase,
                showConfirmButton: false,
                timer: 1500
            });
        }
        function datosCorrectos(frase) {
            Swal({
                position: 'top-end',
                type: 'success',
                title: 'Datos correctos!!',
                showConfirmButton: false,
                timer: 5000
            });
            setTimeout ("document.location.href = 'ListaEmpleado.aspx';", 1500); 
        }
        function definir() {
            var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
            var cad = "";
            var clv = "";
            for (var i = 0; cad.length < 5; i++) {
                clv += str.charAt(Math.random() * 65 + 0);
                cad += str.charAt(Math.random() * 65 + 0);
            }
            document.getElementById("<%=usert.ClientID%>").value = cad;
            document.getElementById("<%=passt.ClientID%>").value = clv;
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
                var nit1 = document.getElementById("<%=nit.ClientID%>").value;
                if (nit1.length == 4 || nit1.length == 11 || nit1.length == 15) {
                    document.getElementById("<%=nit.ClientID%>").value = nit1 + "-";
                }
            } else if (f == 3) {
                var tel1 = document.getElementById("<%=telefono.ClientID%>").value;
                if (tel.length == 4) {
                    document.getElementById("<%=telefono.ClientID%>").value = tel1 + "-";
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label id="lhe" Text="AGREGAR EMPLEADO" runat="server"></asp:Label>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <form id="registrarEmpleado" role="form" runat="server">
                                <div class="form-group">
                                    <label for="nombre">Nombre (*)</label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="nombre" autocomplete="off" runat="server" class="form-control" placeholder="Juan Perez" ToolTip="CAMPO REQUERIDO"  MaxLength="40" ></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="sexo">Sexo (*)</label>
                                </div>
                                <div class="form-group">
                                    <asp:DropDownList ID="sexo" class="form-control" runat="server">
                                        <asp:ListItem Enabled="true" Text="Seleccione" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="MASCULINO" Value="MASCULINO"></asp:ListItem>
                                        <asp:ListItem Text="FEMENINO" Value="FEMENINO"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="nacimiento">Fecha de nacimiento (*)</label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox TextMode="Date" ID="nacimiento" autocomplete="off" runat="server" Cssclass="form-control" parent="dd-MM-yyyy" min="1960-01-01" max="2000-12-31"> </asp:TextBox>
                                 </div>
                                <div class="form-group">
                                    <label for="direccion">Direccion</label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" autocomplete="off" ID="direccion" name="direccion" MaxLength="50" placeholder="Barrio El Centro, SV" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="telefono">Telefono</label>
                                </div>
                                <div class="form-group">
                                    <input type="text" autocomplete="off" class="form-control" id="telefono" name="telefono" max="79999999" min="60000000" oninput="formato(3);" maxlength="9" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="dui">DUI (*)</label>
                                </div>
                                <div class="form-group">
                                    <input type="text" id="dui" name="dui" autocomplete="off" class="form-control" placeholder="02123442-9" oninput="formato(1);" maxlength="10" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="nit">NIT (*)</label>
                                </div>
                                <div class="form-group">
                                    <input type="text" id="nit" name="nit" autocomplete="off" class="form-control" placeholder="0314-010690-442-9" maxlength="17" oninput="formato(2);" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="seguro">Nro. de Seguro Social (*)</label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="seguro" runat="server" autocomplete="off" CssClass="form-control" placeholder="7534298601" MaxLength="10"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="afp">Nro. de APF (*)</label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="afp" runat="server" autocomplete="off" class="form-control" placeholder="147534298601" MaxLength="12"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="contrato">Fecha de Contrato (*)</label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox TextMode="Date" ID="contrato" autocomplete="off" runat="server" Cssclass="form-control" min="2001-01-01" max="Date" parent="dd-MM-yyyy"> </asp:TextBox>
                                 </div>
                                <div class="form-group">
                                    <label for="cargo">Cargo (*)</label>
                                </div>
                                <div class="form-group">
                                    <asp:DropDownList ID="cargo" class="form-control" runat="server">
                                        <asp:ListItem Enabled="true" Text="Seleccione" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="ADMINISTRADOR" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="GERENTE" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="RECEPCIONISTA" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="MANTENIMIENTO" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="OTRO" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="sueldo">SUELDO</label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox TextMode="Number" ID="sueldo" runat="server" ToolTip="SUELDO" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="usuario">USUARIO (Presione Boton "DEFINIR" para ver)</label>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-6 col-md-8">
                                        <div>
                                            <input type="text" id="usert" name="usert" class="form-control" placeholder="Usuario" readonly runat="server" />
                                        </div>
                                        <div>
                                            <input type="text" id="passt" name="passt" class="form-control" placeholder="Contraseña" readonly runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-xs-8 col-md-4">
                                        <button type="button" id="defi" class="btn btn-primary btn-lg btn-info" onclick="definir()" runat="server">
                                            <i class="">DEFINIR</i>
                                        </button>
                                    </div>
                                    <br>
                                    <br>
                                </div>

                                <div class="form-group" style="align-self: center;">
                                    <br>
                                    <asp:Button ID="cancelar" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" />
                                    <asp:Button ID="agregar" runat="server" class="btn btn-primary btn-lg btn-success" Text="Guardar" OnClick="agregar_Click" />
                                    <asp:Button ID="agregarm" Visible="false" runat="server" class="btn btn-primary btn-lg btn-success" Text="Guardar" OnClick="agregarm_Click" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
</asp:Content>
