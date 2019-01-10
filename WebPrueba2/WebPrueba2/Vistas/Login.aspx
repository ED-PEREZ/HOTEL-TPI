<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebPrueba2.Vistas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss" />
    <link rel="stylesheet" type="text/css" href="../Estilos/EstiloLogin.css" media="screen" />

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../Estilos/Sweetalert.js"></script> 
    <script type="text/javascript" >
        function completeCampos() {
            Swal({
                position: 'top-end',
                type: 'error',
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
                timer: 1500
            });
            document.location.href = 'Home.aspx';
        }
    </script>
    <title></title>

</head>
<body>
<div class="container">
<h1 class="form-heading">Formulario de sesion</h1>
<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h2>iniciar sesion</h2>
   <p>Por favor ingrese usuario y contraseña</p>
   </div>
    <form id="login" runat="server">
        
        <div class="form-group">

            <asp:TextBox ID="user" runat="server" class="form-control" placeholder="Usuario-git"></asp:TextBox>

        </div>

        <div class="form-group">
            <asp:TextBox ID="pass" runat="server" type="password" class="form-control"  placeholder="Contraseña"></asp:TextBox>

        </div>

        <asp:Button ID="boton1" runat="server" class="btn btn-primary" Text="Iniciar sesion" OnClick="boton1_Click" />

    </form>
    </div>
</div></div>
</body>
</html>
