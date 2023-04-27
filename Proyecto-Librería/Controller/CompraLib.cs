using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using m = Libreria.Model;
using s = Libreria.Database;

namespace Libreria.Controller
{
    public class CompraLib
    {


        public bool Compra(m.Compra compra)
        {
            try
            {
                Database.Database db = new Database.Database();

                db.CompraLibro(compra);

                return true;
            }
            catch
            {
                return false;
            }
        }
    }

}