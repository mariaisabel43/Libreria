using Libreria.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Security.Policy;
using System.Text;
using System.Web;
using System.Web.UI;
using static System.Net.WebRequestMethods;

namespace Libreria.Controller
{
    public class SignUp
    {
         public SignupResponsePayload signupNewUser(SignupResponsePayload user)
         {
             var url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBAs9UuwBvXDUSYTSMb1VwZ4V8K23cYiNM";
             HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
             var postData  = "{'email':'" + user.email + "','password':'" + user.password + "','returnSecureToken':true}";
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
                     SignupResponsePayload payload = JsonConvert.DeserializeObject<SignupResponsePayload>(reader.ReadToEnd());

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
