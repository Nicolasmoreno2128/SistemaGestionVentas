<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioProducto.aspx.cs" Inherits="SistemaGestionVentas.Web.FormularioProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Formulario de Producto</h1>

            <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblDescripcion" runat ="server" Text="Descripcion"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblUrlImagen" runat="server" Text="UrlImagen"> </asp:Label>
            <asp:TextBox ID="txtUrlImagen" runat="server"></asp:TextBox>
            <br />  

            <asp:Label ID="lblPrecio" runat="server" Text="Precio"></asp:Label>
            <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblStock" runat="server" Text="Stock"></asp:Label>
            <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblMedida" runat="server" Text="Medida"></asp:Label>
            <asp:TextBox ID="txtMedida" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="lblMarca" runat="server" Text="Marca"></asp:Label>
            <asp:DropDownList ID="ddlMarca" runat="server"></asp:DropDownList>
            <br />

            <asp:Label ID="lblCategoria" runat="server" Text="Categoria"></asp:Label>
            <asp:DropDownList ID="ddlCategoria" runat="server"></asp:DropDownList>
            <br />



            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
        </div>
    </form>
</body>
</html>
