<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Libreria.Views.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.2/lux/bootstrap.min.css" />
    <link href="../css/libros.css" rel="stylesheet" />
    <script src="../js/site.js"></script>
    <title>Crear cuenta</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card" id="cardSingup" runat="server">
                    <div class="card-body">
                        <div class="form-group">
                            <label class="form-label mt-4">Crear cuenta</label>
                            <div class="form-floating mb-3">
                                <input type="email" runat="server" class="form-control" id="txtEmail" placeholder="name@example.com" />
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div class="form-floating">
                                <input type="text" runat="server" class="form-control" id="txtPassword" placeholder="Password" />
                                <label for="floatingPassword">Password</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="Libreria.aspx" onclick="btnSignUp_ServerClick">SignUp</a>
                      <%--<asp:LinkButton ID="btnSignUp" runat="server" OnClick="btnSignUp_ServerClick" >SignUp</asp:LinkButton>--%> 
                    </div>
                </div>
                
    </form>
</body>
</html>
