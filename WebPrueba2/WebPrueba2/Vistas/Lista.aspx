<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="WebPrueba2.Vistas.Lista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Servicio al Cuarto
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
            <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista de Pedidos Solicitados
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <div class="col-lg-12"> 
                           
                                <asp:Label ID="Label1" runat="server" Text=""/>
                                <asp:GridView ID="gvFalse"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  >                                    
                                    <Columns>   
                                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" ItemStyle-CssClass="danger" />
                                        <asp:TemplateField HeaderText="Foto" ItemStyle-CssClass="danger" >
                                            <ItemTemplate>
                                                <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="precio" HeaderText="Precio" ItemStyle-CssClass="danger" />
                                    </Columns>
                                 </asp:GridView> 
                           
                         </div>
                     </div>
                 </div>
             </div>
         </div>

        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Lista de Pedidos Recibidos
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <div class="col-lg-12"> 
                            
                                <asp:Label ID="valida" runat="server" Text=""/>
                                <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  >                                    
                                    <Columns>   
                                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" ItemStyle-CssClass="success" />
                                        <asp:TemplateField HeaderText="Foto" ItemStyle-CssClass="success" >
                                            <ItemTemplate>
                                                <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="precio" HeaderText="Precio" ItemStyle-CssClass="success" />
                                    </Columns>
                                 </asp:GridView> 
                            <p class="text-success">
                                <asp:Label ID="total" runat="server" Text=""/>
                            </p>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="final" runat="server">
</asp:Content>
