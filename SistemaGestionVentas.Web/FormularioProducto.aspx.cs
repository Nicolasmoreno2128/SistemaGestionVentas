using SistemaGestionVentas.Data;
using SistemaGestionVentas.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaGestionVentas.Web
{
    public partial class FormularioProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            MarcaData marcaData = new MarcaData();
            ddlMarca.DataSource = marcaData.Listar();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "IdMarca";
            ddlMarca.DataBind();

            CategoriaData categoriaData = new CategoriaData();
            ddlCategoria.DataSource = categoriaData.Listar();
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "IdCategoria";
            ddlCategoria.DataBind();

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];

                if (id != null)
                {

                    ProductoData data = new ProductoData();
                    Producto producto = data.ObtenerPorID(int.Parse(id));

                    txtNombre.Text = producto.Nombre;
                    txtDescripcion.Text = producto.Descripcion;
                    txtUrlImagen.Text = producto.UrlImagen;
                    txtPrecio.Text = producto.Precio.ToString();
                    txtStock.Text = producto.Stock.ToString();
                    txtMedida.Text = producto.Medida;
                    
                    ddlMarca.SelectedValue = producto.IdMarca.ToString();
                    ddlCategoria.SelectedValue = producto.IdCategoria.ToString();

                    Response.Write("Estoy modificando el producto ID: " + id);
                }
                else
                {
                    Response.Write("Estoy dando de alta un producto nuevo");
                }
            }

        }
    }
}