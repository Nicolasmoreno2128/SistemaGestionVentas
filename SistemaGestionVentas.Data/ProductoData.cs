using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaGestionVentas.Dominio;

namespace SistemaGestionVentas.Data
{
    public class ProductoData
    {

        public List <Producto> Listar()
        {
            List<Producto> lista = new List<Producto>();

            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=SistemaGestionVentasBD; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "SELECT IdProducto, Nombre, Descripcion, UrlImagen, Precio, Stock, IdMarca, IdCategoria, Medida, Estado FROM Producto";
                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Producto producto = new Producto();
                    producto.IdProducto = (int) lector["IdProducto"];
                    producto.Nombre = (string) lector["Nombre"];
                    
                    if (!(lector["Descripcion"] is DBNull))
                        producto.Descripcion = (string) lector["Descripcion"];
                    
                    if (!(lector["UrlImagen"] is DBNull))
                        producto.UrlImagen = (string)lector["UrlImagen"];
                    producto.Precio = (decimal) lector["Precio"];
                    producto.Stock = (int) lector["Stock"];
                    producto.IdMarca = (int) lector["IdMarca"];
                    producto.IdCategoria = (int)lector["IdCategoria"];
                    
                    if (!(lector["Medida"] is DBNull))
                        producto.Medida = (string) lector["Medida"];
                    producto.Estado = (bool) lector["Estado"];
                    lista.Add(producto);
                }
                conexion.Close();

            }
            catch (Exception)
            {

                throw;
            }




            return lista;
        }
    }
}