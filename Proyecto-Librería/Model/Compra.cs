using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Libreria.Model
{
    public class Compra : Libros
    {
        public int IdCompra { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Direccion { get; set; }
        public string Pais { get; set; }
        public string Provincia { get; set; }
        public int Postal { get; set; }
        public decimal Prcio { get; set; }
        public LoginResponsePayload Session { get; set; }
        public decimal TotalC()
        {
            return this.Precio;
        }

    }
}