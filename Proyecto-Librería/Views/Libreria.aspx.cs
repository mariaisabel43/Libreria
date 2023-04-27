using Libreria.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Libreria.Controller;
using m = Libreria.Model;
using System.Web.UI.HtmlControls;

namespace Libreria
{
    public partial class Libreria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*c.Libros librosController = new c.Libros();

            repLibros.DataSource = librosController.GetLibros();
            repLibros.DataBind();*/
        

             if (!IsPostBack)
             {
                IsLogged();
                string session = Request.QueryString["session"];

                 if (session == "false")
                 {
                     Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('You must login to access this page')", true);
                 }
                 c.Libros librosController = new c.Libros();

                 repLibros.DataSource = librosController.GetLibros();
                 repLibros.DataBind();
                 }
          
         }
         
        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {
            string msg = string.Empty;
            c.Login loginController = new c.Login();

            LoginResponsePayload loginInfo = loginController.SignInWithPassword(new Model.LoginResponsePayload
            {
                email = txtEmail.Value,
                password = txtPassword.Value
            });

            if (loginInfo != null && loginInfo.registered)
            {
                Session["loginInfo"] = loginInfo;

                msg = "Bienvenido " + txtEmail.Value;
                IsLogged();
            }
            else
            {
                msg = "Datos incorrectos";
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('" + msg + "')", true);
        }
        public void IsLogged()
        {
            if (Session["loginInfo"] != null)
            {
                m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];

                lblName.InnerText = session.email;
                cardUser.Attributes.Remove("hidden");
            }
        }

        private void IsLogOut()
        {
            if (Session["loginInfo"] == null)
            {
                cardUser.Attributes.Add("hidden", "hidden");
            }
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Clear();
            IsLogOut();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('Login','Gracias por visitarnos')", true);
        }
    
    protected void btnCarrito_ServerClick(object sender, EventArgs e)
        {           
            m.Carrito carrito = (m.Carrito)Session["Carrito"];

            //c.CompraLib controllerCompraLib = new c.CompraLib();

            //controllerCompraLib.Compralibro(CompraLib);
        }
        protected void BuscadorL()
        {

            using (SqlConnection connection = new SqlConnection())
            {
                connection.Open();
                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spBuscador";
                cmd.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = Buscador.Value;
                cmd.Parameters.Add("@Titulo", SqlDbType.VarChar).Value = Buscador.Value;


                /*     string searchValue = Buscador.Value;
                 c.Libros searchController = new c.Libros();
                 List<m.Libros> searchBook = searchController.Busca(searchValue);*/

                repLibros.DataSource = cmd.ExecuteReader();
                repLibros.DataBind();
            }
            
        }
        protected void btnBuscar_ServerClick(object sender, EventArgs e)
        {
            BuscadorL();
        }
        public void Cargar()
        {
            m.LoginResponsePayload session = (m.LoginResponsePayload)Session["loginInfo"];
            c.Libros librosController = new c.Libros();
            repFav.DataSource = librosController.GetLibros();
            repFav.DataBind();
        }
        protected void btnFav_ServerClick(object sender, EventArgs e)
        {
            Cargar();
        }
    
    }
}