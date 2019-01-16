<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reserva.aspx.cs" Inherits="WebPrueba2.Vistas.Reserva" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet"/>

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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

</head>

<body>

        <!-- Navigation -->

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <form id="login" runat="server">
                    <div class="row">      
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Reserva
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">

                                        <asp:HiddenField ID="ContentPlaceHolder1_idha" runat="server" />
                                        <asp:HiddenField ID="ContentPlaceHolder1_ha" runat="server" />
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
                                               <input type="text" id="ContentPlaceHolder1_numha" name="ha" class="form-control" placeholder="Seleccione" readonly runat="server" />
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

                               </div>
                            </div>
                        </div>

                    </div>
             </div>
    </div> 
            </form>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>

