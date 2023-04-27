using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;
using m = Libreria.Model;

namespace Libreria.Controller
{
    public class Libros
    {
        public List<m.Libros> GetLibros()
        {
                Database.Database db = new Database.Database();
                DataTable dt = db.GetLibro();
                return ConvertDTToList(dt);
        }

        public List<m.Libros> GetLib(string ISBN)
        {
            Database.Database db = new Database.Database();
            DataTable dt = db.GetLib(ISBN);
            return ConvertDTToList(dt);
        }
        /*public List<m.Libros> Busca(string searchValue)
        {
            Database.Database db = new Database.Database();
            DataTable dt = db.Busca(searchValue);

            return ConvertDTToList(dt);
        }*/
        public List<m.Libros> ConvertDTToList(DataTable dt)
        {
            List<m.Libros> librosList = new List<m.Libros>();
            foreach (DataRow row in dt.Rows)
            {
                librosList.Add(new m.Libros
                {
                    ISBN = row["ISBN"].ToString(),
                    Portada = row["Portada"].ToString(),
                    Titulo = row["Titulo"].ToString(),
                    Autor = row["Autor"].ToString(),
                    Descripcion = row["Descripcion"].ToString(),
                    FechaRegistro = Convert.ToDateTime(row["FechaRegistro"]),
                    Precio = Convert.ToDecimal(row["Precio"])
                });
            }
            return librosList;
        }
    }
}
