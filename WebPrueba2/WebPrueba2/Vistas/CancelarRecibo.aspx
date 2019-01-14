<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/Menu.Master" AutoEventWireup="true" CodeBehind="CancelarRecibo.aspx.cs" Inherits="WebPrueba2.Vistas.CancelarRecibo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Cancelar
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
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="registrarCatalogo" role="form" runat="server">
     <div class="row">
           <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        Catalogo
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <asp:HiddenField ID="hf" runat="server" />
                                        <asp:HiddenField ID="hftp" runat="server" />
                                        <div class="form-group">
                                            <label for="fecha">Fecha de Emision (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="fecha" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <label for="cantidad">Forma de Pago (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:DropDownList ID="forma" class="form-control" runat="server">
                                                <asp:ListItem Enabled="true" Text="Seleccione" Value="0"></asp:ListItem>
                                                <asp:ListItem  Text="Efectivo" Value="Efectivo"></asp:ListItem>
                                                <asp:ListItem  Text="Tarjeta de Credito" Value="Tarjeta de Credito"></asp:ListItem>
                                        </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="fecha">Total a Pagar (*)</label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="Topa" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <br>                                                        
                                            <asp:Button ID="cancelar" runat="server" class="btn btn-primary btn-lg btn-warning" Text="Cancelar" />   
                                            <asp:Button ID="pagar" runat="server" class="btn btn-primary btn-lg btn-success"  Text="Guardar" OnClick="pagar_Click" />
                                        </div>          
                               </div>

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

                            <div class="col-lg-6">
                                  <div class="panel panel-default">
                                      <div class="panel-heading">
                                          Habitacion 
                                      </div>
                                      <div class="panel-body">
                                          <div class="table-responsive">
                                              <div class="col-lg-12">
                                                  <asp:Label ID="Label2" runat="server" Text=""/>
                                                  <asp:GridView ID="gvTipo"  class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  > 
                                                  <Columns>   
                                                      <asp:BoundField DataField="numhabitacion" HeaderText="Numero de Habitacion #" ItemStyle-CssClass="success" />
                                                      <asp:BoundField DataField="tipohabitacion" HeaderText="Tipo de Habitcion" ItemStyle-CssClass="success" />
                                                      <asp:TemplateField HeaderText="Foto" ItemStyle-CssClass="success" >
                                                          <ItemTemplate>
                                                              <asp:Image ID="imagen" runat="server" Width="100px" Height="100px" ImageUrl='<%#"data:image/jpg;base64,"+ Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:BoundField DataField="precio" HeaderText="Precio" ItemStyle-CssClass="success" />
                                                  </Columns>
                                                </asp:GridView>                                                                                                          
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                               </div>

                        </div>
                    </div>
             </div>    
       </div>
       </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="final" runat="server">
</asp:Content>
