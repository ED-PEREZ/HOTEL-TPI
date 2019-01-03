<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebPrueba2.Vistas.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="false" >
                <Columns>
                    <asp:BoundField DataField="usuario" HeaderText="Usuario" />
                    <asp:BoundField DataField="contra" HeaderText="Contraseña" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label Text="Ed" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
