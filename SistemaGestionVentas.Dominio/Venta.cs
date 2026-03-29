using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SistemaGestionVentas.Dominio
{
    public class Venta
    {
        public int IdVenta { get; set; }
        public int IdCliente { get; set; }
        public int IdUsuario { get; set; }
        public DateTime Fecha { get; set; } 
        public decimal Total { get; set; }
        public bool Estado { get; set; }
        public Cliente Cliente { get; set; } = new Cliente();
        public Usuario Usuario { get; set; } = new Usuario();
        public List<DetalleVenta> Detalles { get; set; } = new List<DetalleVenta>();
    }
}
