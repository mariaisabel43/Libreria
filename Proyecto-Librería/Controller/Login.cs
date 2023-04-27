using Libreria.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Web;

namespace Libreria.Controller
{
    public class Login
    { 
        public LoginResponsePayload SignInWithPassword(LoginResponsePayload user)
        {
            var url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBAs9UuwBvXDUSYTSMb1VwZ4V8K23cYiNM";
            var postData = "{'email':'" + user.email + "','password':'" + user.password + "','returnSecureToken':true}";

            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            request.Method = "POST";
            request.ContentType = "application/json";

            using (Stream dataStream = request.GetRequestStream())
            {
                dataStream.Write(Encoding.UTF8.GetBytes(postData), 0, Encoding.UTF8.GetBytes(postData).Length);
            }

            try
            {
                HttpWebResponse response = request.GetResponse() as HttpWebResponse;
                using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                {
                    LoginResponsePayload payload = JsonConvert.DeserializeObject<LoginResponsePayload>(reader.ReadToEnd());

                    return payload;
                }
            }
            catch
            {
                return null;
            }
        }
    }
}