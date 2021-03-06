﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="ListaFactura.aspx.cs" Inherits="WebPrueba2.Vistas.ListaFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Recepcion
    <script type="text/javascript">
        function abrirVentana(id){
        var url = id;
            window.open(url, "Nuevo", "alwaysRaised=no,toolbar=no,menubar=no,status=no,"+
                "resizable = no, width = 800, height = 400, location = no");           
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista de Facturas 
                    <div class="left">
                        <asp:LinkButton ID="btRepm" ToolTip="REPORTE" CssClass="btn btn-primary btn-sm btn-success" OnClick="btRepm_Click" runat="server">
                               <i class="ace-icon fa fa-file-pdf-o bigger-120">IMPRIMIR</i>
                        </asp:LinkButton>
                     </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12"> 

                                <asp:Label ID="ver" runat="server" Text=""></asp:Label>
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  >                                    
                                    <Columns>   
                                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                        <asp:BoundField DataField="dui" HeaderText="DUI" />
                                        <asp:BoundField DataField="total" HeaderText="Total Cancelado $" />
                                        <asp:TemplateField HeaderText="Opciones" ItemStyle-Width="15%">
                                        <ItemTemplate>
                                           <asp:LinkButton ID="btRep" target="_blank"  CommandArgument='<%# Eval("idrecibo") %>' ToolTip="REPORTE" CssClass="btn btn-primary btn-sm btn-success" OnClick="btRep_Click" runat="server">
                                                <i class="ace-icon fa fa-file-pdf-o bigger-120"></i>
                                            </asp:LinkButton>
                                            </nav>
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
    $(document).ready(function() {
        $("#<%=gvTipo.ClientID %>").DataTable({
            responsive: true
        });
    });
    </script>
</asp:Content>
