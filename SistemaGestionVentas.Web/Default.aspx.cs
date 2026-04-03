using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaGestionVentas.Data;
using SistemaGestionVentas.Dominio;

namespace SistemaGestionVentas.Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductoData data = new ProductoData();
                dgvProductos.DataSource = data.Listar();
                dgvProductos.DataBind();

            }

        }
    }
}