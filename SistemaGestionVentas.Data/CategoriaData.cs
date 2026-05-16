using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SistemaGestionVentas.Dominio;
using System.Data.SqlClient;

namespace SistemaGestionVentas.Data
{
    public class CategoriaData
    {
        public List<Categoria> Listar()
        {
            List<Categoria> lista = new List<Categoria>();

            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=SistemaGestionVentasBD; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "SELECT IdCategoria, Nombre, Descripcion,Estado FROM CATEGORIA";

                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.IdCategoria = (int)lector["IdCategoria"];
                    categoria.Nombre = (string)lector["Nombre"];

                    if (!(lector["Descripcion"] is DBNull))
                        categoria.Descripcion = (string)lector["Descripcion"];

                    categoria.Estado = (bool)lector["Estado"];
                    lista.Add(categoria);
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
