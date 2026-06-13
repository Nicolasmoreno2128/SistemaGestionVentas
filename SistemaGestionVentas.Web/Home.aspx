<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SistemaGestionVentas.Web.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <div class="home-hero p-5 mb-4 rounded-4 shadow-sm">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <span class="badge bg-primary mb-3">Portfolio .NET Web Forms</span>
                    <h1 class="display-5 fw-bold mb-3">Sistema Gestión de Ventas</h1>
                    <p class="fs-5 text-muted mb-4">
                        Proyecto personal desarrollado en C# con ASP.NET Web Forms y SQL Server, orientado a la gestión de productos, stock, clientes y ventas.
                    </p>
                    <a href="Default.aspx" class="btn btn-primary btn-lg">
                        Ir a Productos
                    </a>
                </div>

                <div class="col-md-4 text-center d-none d-md-block">
                    <div class="home-icon">
                            <i class="bi bi-box-seam"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-3 mb-4">

    <div class="col-md-3">
        <div class="card shadow-sm stat-card">
            <div class="card-body">
                <span class="text-muted small">Productos Registrados</span>
                <br />
                <h2 class="fw-bold mt-2">
                    <asp:Label ID="lblCantidadProductos" runat="server"></asp:Label>
                </h2>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card shadow-sm stat-card">
            <div class="card-body">
                <span class="text-muted small">Base de datos</span>
                <br />
                <h2 class="fw-bold mt-2">SQL Server</h2>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card shadow-sm stat-card">
            <div class="card-body">
                <span class="text-muted small">Tecnología</span>
                <br />
                <h2 class="fw-bold mt-2">ASP.NET</h2>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="card shadow-sm stat-card">
            <div class="card-body">
                <span class="text-muted small">Estado</span>
                <br />
                <h2 class="fw-bold mt-2">Activo</h2>
            </div>
        </div>
    </div>

</div>

        <div class="row g-4">

            <div class="col-md-4">
                <div class="card h-100 shadow-sm module-card">
                    <div class="card-body">
                        <div class="module-icon bg-primary text-white">📦</div>
                        <h5 class="card-title mt-3">Productos</h5>
                        <p class="card-text text-muted">
                            Alta, modificación, eliminación lógica, imágenes, stock, marcas y categorías.
                        </p>
                        <a href="Default.aspx" class="btn btn-outline-primary w-100">
                            Gestionar productos
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm module-card">
                    <div class="card-body">
                        <div class="module-icon bg-secondary text-white">👥</div>
                        <h5 class="card-title mt-3">Clientes</h5>
                        <p class="card-text text-muted">
                            Módulo preparado para administrar clientes y su información de contacto.
                        </p>
                        <a href="#" class="btn btn-outline-secondary disabled">
                            Próximamente
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm module-card">
                    <div class="card-body">
                        <div class="module-icon bg-success text-white">💰</div>
                        <h5 class="card-title mt-3">Ventas</h5>
                        <p class="card-text text-muted">
                            Módulo preparado para registrar ventas, detalles y control de stock.
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