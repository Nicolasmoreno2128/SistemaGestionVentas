using SistemaGestionVentas.Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace SistemaGestionVentas.Data
{
    public class MarcaData
    {
      public List<Marca> Listar()
        {
            List<Marca> lista = new List<Marca>();

            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=SistemaGestionVentasBD; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "SELECT IdMarca, Nombre, Descripcion,Estado FROM MARCA";

                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Marca marca = new Marca();
                    marca.IdMarca = (int)lector["IdMarca"];
                    marca.Nombre = (string)lector["Nombre"];

                    if (!(lector["Descripcion"] is DBNull))
                        marca.Descripcion = (string)lector["Descripcion"];

                    marca.Estado = (bool)lector["Estado"];
                    lista.Add(marca);
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
