using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Libreria.Model
{
    public class Carrito
    {
        public int IdCarrito { get; set; }
        public Libros oISBN { get; set; }
        public User oUsuario { get; set; }
    }
}