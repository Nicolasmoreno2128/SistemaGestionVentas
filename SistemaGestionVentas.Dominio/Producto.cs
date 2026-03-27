using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaGestionVentas.Dominio
{
    public class Producto
    {
        public int IdProducto { get; set; }

        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string UrlImagen { get; set; }

        public decimal Precio { get; set; }
        public int Stock { get; set; }

        public int IdMarca { get; set; }
        public int IdCategoria { get; set; }

        public string Medida { get; set; }
        public bool Estado { get; set; }

       // public Marca marca { get; set; }
       // public Categoria categoria { get; set; }
    }
}
