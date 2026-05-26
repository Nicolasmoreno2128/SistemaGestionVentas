<%@ Page Title="Sistema de Gestión de Ventas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SistemaGestionVentas.Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold mb-0">Productos</h1>
        <small class="text-muted">Gestión de productos del sistema</small>
    </div>

    <a href="FormularioProducto.aspx" class="btn btn-primary">
        Nuevo Producto
    </a>
</div>
        <asp:GridView 
            ID="dgvProductos" 
            runat="server" 
            AutoGenerateColumns="false" 
            CssClass="table table-striped table-bordered table-hover" 
            OnRowCommand="dgvProductos_RowCommand">

            <Columns>
                <asp:TemplateField HeaderText="Imagen">
                    <ItemTemplate>

                        <a href='<%# Eval("UrlImagen") %>' target="_blank">

                            <img src='<%# Eval("UrlImagen") %>' 
                                 alt="Imagen producto"
                                 style="width: 70px; height: 70px; object-fit: cover; border-radius: 8px; cursor:pointer;" />
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
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