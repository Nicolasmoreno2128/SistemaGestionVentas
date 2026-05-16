using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Configuration;
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
        public Producto ObtenerPorID (int id)
        {

            Producto producto = new Producto();

            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=SistemaGestionVentasBD; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "Select p.IdProducto, p.Nombre, p.Descripcion, p.UrlImagen, p.Precio, p.Stock, p.IdMarca, m.Nombre AS Marca, p.IdCategoria, c.Nombre AS Categoria, p.Medida, p.Estado FROM PRODUCTO AS p " +
                    "INNER JOIN MARCA AS m ON p.IdMarca = m.IdMarca " +
                    "INNER JOIN CATEGORIA AS c ON p.IdCategoria = c.IdCategoria " +
                    "WHERE IdProducto = @id";
                comando.Connection = conexion;

                // Add parameter and execute reader after opening the connection
                comando.Parameters.AddWithValue("@id", id);

                conexion.Open();
                lector = comando.ExecuteReader();

                if (lector.Read())
                {
                    producto.IdProducto = (int)lector["IdProducto"];
                    producto.Nombre = (string)lector["Nombre"];

                    if (!(lector["Descripcion"] is DBNull))
                        producto.Descripcion = (string)lector["Descripcion"];

                    if (!(lector["UrlImagen"] is DBNull))
                        producto.UrlImagen = (string)lector["UrlImagen"];

                    producto.Precio = (decimal)lector["Precio"];
                    producto.Stock = (int)lector["Stock"];
                    producto.IdMarca = (int)lector["IdMarca"];
                    producto.IdCategoria = (int)lector["IdCategoria"];

                    if (!(lector["Medida"] is DBNull))
                        producto.Medida = (string)lector["Medida"];

                    producto.Estado = (bool)lector["Estado"];
                }

                conexion.Close();
                return producto;
            }
            catch (Exception)
            {

                throw;
            }

        }
        public void ModificarProducto(Producto producto)
        {
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();


            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=SistemaGestionVentasBD; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "UPDATE PRODUCTO SET Nombre = @nombre, Descripcion = @descripcion, UrlImagen = @urlImagen, Precio = @precio, Stock = @stock, IdMarca = @idMarca, IdCategoria = @idCategoria, Medida = @medida WHERE IdProducto = @idProducto";

                comando.Parameters.AddWithValue("@nombre", producto.Nombre);
                comando.Parameters.AddWithValue("@descripcion", producto.Descripcion);
                comando.Parameters.AddWithValue("@urlImagen", producto.UrlImagen);
                comando.Parameters.AddWithValue("@precio", producto.Precio);
                comando.Parameters.AddWithValue("@stock", producto.Stock);
                comando.Parameters.AddWithValue("@idMarca", producto.IdMarca);
                comando.Parameters.AddWithValue("@idCategoria", producto.IdCategoria);
                comando.Parameters.AddWithValue("@medida", producto.Medida);
                comando.Parameters.AddWithValue("@idProducto", producto.IdProducto);

                comando.Connection = conexion;
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();

            }
            catch (Exception)
            {

                throw;
            }

        }
        public void AgregarProducto (Producto producto)
        {

            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=SistemaGestionVentasBD; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "INSERT INTO PRODUCTO (Nombre, Descripcion, UrlImagen, Precio, Stock, IdMarca, IdCategoria, Medida) " +
                    "VALUES (@Nombre, @Descripcion, @UrlImagen, @Precio, @Stock, @IdMarca, @IdCategoria, @Medida)";
                
                comando.Parameters.AddWithValue("@Nombre", producto.Nombre);
                comando.Parameters.AddWithValue("@Descripcion", producto.Descripcion);
                comando.Parameters.AddWithValue("@UrlImagen", producto.UrlImagen);
                comando.Parameters.AddWithValue("@Precio", producto.Precio);
                comando.Parameters.AddWithValue("@Stock", producto.Stock);
                comando.Parameters.AddWithValue("@IdMarca", producto.IdMarca);
                comando.Parameters.AddWithValue("@IdCategoria", producto.IdCategoria);
                comando.Parameters.AddWithValue("@Medida", producto.Medida);
                
                comando.Connection = conexion;
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception)
            {

                throw;
            }




        }
    }
}