<%@ Page Title="Formulario de Producto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioProducto.aspx.cs" Inherits="SistemaGestionVentas.Web.FormularioProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <h1 class="mb-4">Formulario de Producto</h1>

        <div class="card shadow-sm">
            <div class="card-body">

                <div class="mb-3">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Label ID="lblUrlImagen" runat="server" Text="URL de imagen" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtUrlImagen" runat="server" CssClass="form-control" ClientIDMode="Static" onkeyup="actualizarPreviewImagen()" />
                </div>
                <div class="mb-3">
                    <asp:Image ID="imgProducto" runat="server" CssClass="img-thumbnail mt-2" Width="200px" ClientIDMode="Static" />
                </div>

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <asp:Label ID="lblPrecio" runat="server" Text="Precio" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-4 mb-3">
                        <asp:Label ID="lblStock" runat="server" Text="Stock" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtStock" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-4 mb-3">
                        <asp:Label ID="lblMedida" runat="server" Text="Medida" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtMedida" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblMarca" runat="server" Text="Marca" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>

                    <div class="col-md-6 mb-3">
                        <asp:Label ID="lblCategoria" runat="server" Text="Categoría" CssClass="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                </div>

                <div class="mt-3">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" />
                    <a href="Default.aspx" class="btn btn-secondary ms-2">Volver</a>
                </div>

            </div>
        </div>

    </div>
            <script>
                function actualizarPreviewImagen() {
                    var url = document.getElementById("txtUrlImagen").value;
                    var imagen = document.getElementById("imgProducto");

                    imagen.src = url;
                }
        </script>

</asp:Content>