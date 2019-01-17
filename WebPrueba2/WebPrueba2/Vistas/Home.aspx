<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebPrueba2.Vistas.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
Inicio
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Contenido
    <div class="row">
                <div class="col-xs-6 col-sm-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-building fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><i class="fa  fa-thumbs-o-up"></i></div>
                                    <div>El Mejor Hotel</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"></span>
                                <span class="pull-right"></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-4">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-bed fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><i class="fa  fa-thumbs-o-up"></i></div>
                                    <div>Habitaciones de Calidad</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"></span>
                                <span class="pull-right"></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-xs-6 col-sm-4">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa  fa-cutlery fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><i class="fa  fa-thumbs-o-up"></i></div>
                                    <div>Lo Mejor en Gastronomia</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left"></span>
                                <span class="pull-right"></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
    <div class="row" align="center">
        
        <asp:Image ID="image" runat="server" ImageUrl="~/images/265-swimming-pool-22-hotel-barcelo-costa-cancun_tcm7-126728.jpg" Height="322px" Width="751px"/>
    </div>
</asp:Content>
