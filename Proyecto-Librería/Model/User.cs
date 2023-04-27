using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace Libreria.Model
{
    public class User
    {
        public int IdUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Correo { get; set; }
        public string Contrasena { get; set; }
        public string ConfirmarContrasena { get; set; }
    }
    public class LoginResponsePayload
    {
        public string idToken { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string refreshToken { get; set; }
        public string expiresIn { get; set; }
        public string localId { get; set; }
        public bool registered { get; set; }
    }
    public class SignupResponsePayload
    {
        public string idToken { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string refreshToken { get; set; }
        public string expiresIn { get; set; }
        public string localId { get; set; }
        public bool registered { get; set; }
    }
}