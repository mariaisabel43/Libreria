using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Libreria.Model
{
    public class DetalleComp
    {
        public int IdDetalleCompra { get; set; }
        public int IdCompra { get; set; }
        public Libros oISBN { get; set; }
      //  public Libros oProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal Total { get; set; }
    }
}