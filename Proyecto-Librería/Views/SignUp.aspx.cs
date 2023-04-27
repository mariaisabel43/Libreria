using Libreria.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using c = Libreria.Controller;

namespace Libreria.Views
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnSignUp_ServerClick(object sender, EventArgs e)
            {
                string msg = string.Empty;
                c.SignUp signupController = new c.SignUp();

                SignupResponsePayload signupInfo = signupController.signupNewUser(new Model.SignupResponsePayload
                {
                    email    = txtEmail.Value,
                    password = txtPassword.Value
                });

                if (signupInfo.registered)
                {
                    Session["signupInfo"] = signupInfo;

                    msg = "Create " + txtEmail.Value;
                    //lblName.InnerText = txtEmail.Value;
                    cardSingup.Attributes.Add("hidden", "hidden");
                   // cardUser.Attributes.Remove("hidden");
                }
                else
                {
                    msg = "Incorrect credentials";
                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal('" + msg + "')", true);
            }

        }
    }