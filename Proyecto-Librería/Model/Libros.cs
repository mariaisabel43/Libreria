using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Libreria.Model
{
    public class Libros
    {
        public string ISBN { get; set; }
        public string Portada { get; set; }
        public string Titulo { get; set; }
        public string Autor { get; set; }
        public DateTime FechaRegistro { get; set; }
        public decimal Precio { get; set; }
        public string Descripcion { get; set; }


    }
}