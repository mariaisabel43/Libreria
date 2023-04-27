using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Libreria.Controller;
using m = Libreria.Model;

namespace Libreria.Views
{
    public partial class Compra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["loginInfo"] == null)
                {
                    Response.Redirect("Libreria.aspx?session=false");
                }

                string ISBN = Request.QueryString["ISBN"];
                c.Libros libroController = new c.Libros();
                List<m.Libros> Libros = libroController.GetLib(ISBN);
                Session["libros"] = Libros;
                repCarrito.DataSource = Libros;
                repCarrito.DataBind();
            }
        }
        public void btnProcesar_ServerClick(object sender, EventArgs e)
        {
            List<m.Libros> libro = (List<m.Libros>)Session["libros"];

            m.Compra compra = new m.Compra()
            {
                ISBN = libro[0].ISBN,
                Session = (m.LoginResponsePayload)Session["loginInfo"],
                Precio = libro[0].Precio,
            };
            compra.Total = compra.TotalC();
        }
    }
}