using Libreria.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using m = Libreria.Model;

namespace Libreria.Database
{
    public class Database
    {
        const string database = "Libreria";
        const string server = "localhost";
        SqlConnection connection = new SqlConnection($"Data Source={server};Initial Catalog={database};Integrated Security=True");
        public DataTable GetLibro()
         {
            return this.Fill("[dbo].[spGetLibro]", null);
        }

         public DataTable GetLib(string ISBN)
         {
             List<SqlParameter> param = new List<SqlParameter>()
             {
                 new SqlParameter("@ISBN", ISBN),
             };
            return this.Fill("[dbo].[spGetLib]", param);
        }
        public DataTable Busaca(string searchValue)
        {
            List<SqlParameter> param = new List<SqlParameter>()
            {
                new SqlParameter("@search", searchValue),
            };

            return this.Fill("[dbo].[spSearch]", param);
        }
        public void CompraLibro(m.Compra compra)
         {
            List<SqlParameter> param = new List<SqlParameter>()
             {
                new SqlParameter("@IdCompra", compra.IdCompra),
                new SqlParameter("@Nombre", compra.Nombre),
                new SqlParameter("@Email", compra.Email),
                new SqlParameter("@Dirreccion", compra.Direccion),
                new SqlParameter("@Pais", compra.Pais),
                new SqlParameter("@Provincia", compra.Provincia),
                new SqlParameter("@Postal", compra.Postal),
             };
            this.ExecuteQuery("[dbo].[spObCompra]", param);
        }

        public DataTable Fill(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    DataTable ds = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void ExecuteQuery(string storedProcedure, List<SqlParameter> param)
        {
            try
            {
                using (this.connection)
                {
                    connection.Open();
                    SqlCommand cmd = connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = storedProcedure;

                    if (param != null)
                    {
                        foreach (SqlParameter p in param)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }

                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}