﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarHabitacion.aspx.cs" Inherits="WebPrueba2.Vistas.BuscarHabitacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title></title>
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
    <script type="text/javascript">
        function selecciona(tipo,id) {
            window.opener.document.getElementById('ContentPlaceHolder1_numha').value = tipo;
            window.opener.document.getElementById('ContentPlaceHolder1_ha').value = tipo;
            window.opener.document.getElementById('ContentPlaceHolder1_idha').value = id;
            window.close();
        }
        function ver(id) {
            document.location.href = 'BuscarHabitacionVer.aspx?id=' + id;
}
    </script>
</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista de Habitacion
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 
                            <form id="form" runat="server">
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"    >
                                    <Columns>   
                                        <asp:BoundField DataField="numhabitacion" HeaderText="Numero de Habitacion #" />
                                        <asp:BoundField DataField="tipohabitacion" HeaderText="Tipo de Habitacion #" />
                                        <asp:TemplateField HeaderText="Foto">
                                        <ItemTemplate>       
                                            <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Opciones">
                                        <ItemTemplate> 
                                            <button type="button" class="btn btn-primary" onclick="selecciona('<%# Eval("numhabitacion") %>','<%# Eval("idhabitacion") %>')" >Retornar</button>
                                            <button type="button" class="btn btn-success" onclick="ver('<%# Eval("idtipohabitacion") %>')" >Ver mas</button>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                                 </asp:GridView> 
                            </form>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
    </div>  

    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>
</html>
