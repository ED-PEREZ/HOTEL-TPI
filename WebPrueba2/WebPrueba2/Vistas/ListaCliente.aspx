﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaCliente.aspx.cs" Inherits="WebPrueba2.Vistas.ListaCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Recepcion
   <script src="../Estilos/Sweetalert.js"></script>
    <script type="text/javascript">
        function abrirVentana(id){
        var url = id;
            window.open(url, "Nuevo", "alwaysRaised=no,toolbar=no,menubar=no,status=no,"+
                "resizable = no, width = 800, height = 400, location = no");           
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
        function eliminar() {
            swal({
                tittle: 'CONFIRME SI',
                text: "DESEA ELIMINAR EL REGISTRO?",
                type: 'info',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'SI, ELIMINAR'
            }).then((result) => {
                if (result.value) {
                    document.getElementById("<%=algo.ClientID%>").value = "eliminar";
                    }
                })
        }
        function datosCorrectos() {
            Swal({
                position: 'top-end',
                type: 'success',
                title: 'Eliminacion completada!!',
                showConfirmButton: false,
                timer: 5000
            });
            setTimeout("document.location.href = 'ListaCliente.aspx'", 1500);
        }
        function datosIncorrectos() {
            Swal({
                position: 'top-end',
                type: 'error',
                title: 'No pudo eliminarse el registro!!',
                showConfirmButton: false,
                timer: 1500
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista de Clientes
                    <div class="left">
                        <asp:LinkButton ID="btRepm" target="_blank" ToolTip="REPORTE" CssClass="btn btn-primary btn-sm btn-success" OnClick="btRepm_Click" runat="server">
                             <i class="ace-icon fa fa-file-pdf-o bigger-120">IMPRIMIR</i>
                        </asp:LinkButton>

                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:TextBox ID="algo" runat="server" />
                            <asp:TextBox ID="contenedor" runat="server" />
                            <asp:TextBox ID="ja" runat="server" />
                            <asp:GridView ID="gvTipo" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                    <asp:BoundField DataField="dui" HeaderText="DUI" />
                                    <asp:BoundField DataField="fechaentrada" DataFormatString="{0:d}" HeaderText="Fecha de Reserva" />
                                    <asp:BoundField DataField="fechasalida" DataFormatString="{0:d}" HeaderText="Fecha de Reserva" />
                                    <asp:BoundField DataField="correo" HeaderText="E-Mail" />
                                    <asp:BoundField DataField="celular" HeaderText="Celular" />
                                    <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="20%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btRep" target="_blank" CommandArgument='<%# Eval("idcliente") %>' ToolTip="REPORTE" CssClass="btn btn-primary btn-sm btn-success" OnClick="btRep_Click" runat="server">
                                                <i class="ace-icon fa fa-file-pdf-o bigger-120"></i>
                                            </asp:LinkButton>
                                            </nav>
                                            <asp:LinkButton ID="Cancelar" CommandArgument='<%# Eval("idcliente") %>' CssClass="btn btn-primary btn-sm btn-primary" OnClick="Cancelar_Click" runat="server">
                                                <i class="ace-icon fa fa-credit-card bigger-120"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btMod" CommandArgument='<%# Eval("idcliente") %>' CssClass="btn btn-primary btn-sm btn-warning" OnClick="btMod_Click" runat="server">
                                                <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btEli" CommandArgument='<%# Eval("idcliente") %>' CssClass="btn btn-primary btn-sm btn-danger" OnClick="btEli_Click" runat="server">
                                               <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="final" runat="server">
    <script>
        $(document).ready(function () {
            $("#<%=gvTipo.ClientID %>").DataTable({
                responsive: true
            });
        });
    </script>
</asp:Content>
