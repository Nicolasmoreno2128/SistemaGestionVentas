<%@ Page Title="Sistema de Gestión de Ventas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaGestionVentas.Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <h1 class="mb-4">Listado de productos</h1>


        <a href="FormularioProducto.aspx" class="btn btn-primary mb-3">Nuevo Producto</a>
        <asp:GridView 
            ID="dgvProductos" 
            runat="server" 
            AutoGenerateColumns="false" 
            CssClass="table table-striped table-bordered table-hover" 
            OnRowCommand="dgvProductos_RowCommand">

            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" HtmlEncode="false" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" />
                <asp:BoundField DataField="Medida" HeaderText="Medida" />
                <asp:BoundField DataField="Marca.Nombre" HeaderText="Marca" />
                <asp:BoundField DataField="Categoria.Nombre" HeaderText="Categoría" />

                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:Button 
                            ID="btnModificar" 
                            runat="server" 
                            Text="Modificar" 
                            CommandName="Modificar" 
                            CommandArgument='<%# Eval("IdProducto") %>' 
                            CssClass="btn btn-warning btn-sm me-1" />

                        <asp:Button 
                            ID="btnEliminar" 
                            runat="server" 
                            Text="Eliminar" 
                            CommandName="Eliminar" 
                            CommandArgument='<%# Eval("IdProducto") %>' 
                            CssClass="btn btn-danger btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

    </div>

</asp:Content>