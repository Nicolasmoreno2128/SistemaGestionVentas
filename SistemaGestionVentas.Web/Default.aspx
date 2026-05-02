<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaGestionVentas.Web.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hola hola</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <h1>Hola mundo</h1>

            <asp:GridView ID="dgvProductos" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCommand="dgvProductos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" HtmlEncode="false" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" />
                    <asp:BoundField DataField="Medida" HeaderText="Medida" />
                    <asp:BoundField DataField="Marca.Nombre" HeaderText="Marca" />
                    <asp:BoundField DataField="Categoria.Nombre" HeaderText="Categoria" />

                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CommandName="Modificar" CommandArgument='<%# Eval("IdProducto") %>' />
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("IdProducto") %>' />
                         </ItemTemplate>
                    </asp:TemplateField>


                </Columns>





            </asp:GridView>
        </div>
    </form>
    

</body>
</html>
