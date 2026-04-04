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
                comando.CommandText = "SELECT p.IdProducto, p.Nombre, p.Descripcion, p.UrlImagen, p.Precio, p.Stock, p.IdMarca, m.Nombre AS Marca, p.IdCategoria, c.Nombre AS Categoria, p.Medida, p.Estado FROM PRODUCTO AS p " +
                    "INNER JOIN MARCA AS m ON p.IdMarca = m.IdMarca " +
                    "INNER JOIN CATEGORIA AS c ON p.IdCategoria = c.IdCategoria";

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
                    
                    producto.IdMarca = (int)lector["IdMarca"];
                    producto.Marca = new Marca();
                    producto.Marca.Nombre = (string)lector["Marca"];

                    producto.IdCategoria = (int)lector["IdCategoria"];
                    producto.Categoria = new Categoria();
                    producto.Categoria.Nombre = (String) lector["Categoria"];

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