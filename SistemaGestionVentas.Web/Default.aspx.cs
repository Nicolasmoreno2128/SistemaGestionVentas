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
 
    protected void dgvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Modificar")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("FormularioProducto.aspx?id=" + id);
            }
            else if (e.CommandName == "Eliminar")
            {
                string id = e.CommandArgument.ToString();
                Response.Write("Eliminar producto ID: " + id);
            }
        }
    }


}