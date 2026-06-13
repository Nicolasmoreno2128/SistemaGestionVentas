<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SistemaGestionVentas.Web.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <div class="p-5 mb-4 bg-light rounded-3 shadow-sm">
            <div class="container-fluid py-4">
                <h1 class="display-5 fw-bold">Sistema Gestión de Ventas</h1>
                <p class="col-md-8 fs-5 text-muted">
                    Administrá productos, clientes y ventas desde una única plataforma.
                </p>
                <a href="Default.aspx" class="btn btn-primary btn-lg">
                    Ir a Productos
                </a>
            </div>
        </div>

        <div class="row g-4">

            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Productos</h5>
                        <p class="card-text text-muted">
                            Gestioná el catálogo, stock, precios, marcas y categorías.
                        </p>
                        <a href="Default.aspx" class="btn btn-outline-primary">
                            Ver productos
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Clientes</h5>
                        <p class="card-text text-muted">
                            Módulo preparado para administrar clientes del sistema.
                        </p>
                        <a href="#" class="btn btn-outline-secondary disabled">
                            Próximamente
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Ventas</h5>
                        <p class="card-text text-muted">
                            Módulo preparado para registrar operaciones de venta.
                        </p>
                        <a href="#" class="btn btn-outline-secondary disabled">
                            Próximamente
                        </a>
                    </div>
                </div>
            </div>

        </div>

    </div>

</asp:Content>