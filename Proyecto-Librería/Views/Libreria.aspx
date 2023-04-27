<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libreria.aspx.cs" Inherits="Libreria.Libreria" %>

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
    <title>Librería Internacional</title>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Librería Internacional.com</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="Libreria.aspx">Libros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#offcanvasExample" data-bs-toggle="offcanvas" aria-controls="offcanvasExample">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#offcanvasFav" data-bs-toggle="offcanvas" aria-controls="offcanvasFav" onselect="select">Favoritos</a>
                            </li>
                            <li id="tabBookings" hidden="hidden" runat="server" class="nav-item">
                                <a class="nav-link" href="Compras.aspx">Compras</a>
                            </li>
                        </ul>
                        <div class="input-group">
                  <div class="form-outline">
                      <input id="Buscador" runat="server" class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar" />  
                      <label class="form-label" for="form1">Search</label>
                  </div>
                    <button id="btnBuscar" runat="server" class="btn btn-outline-success" onserverclick="btnBuscar_ServerClick">Buscar</button>
                </div>
                    </div>
                </div>
                 </nav>
            </div>
           
            <asp:Repeater ID="repLibros" runat="server">
                <HeaderTemplate>
                    <div class="container">
                        <div class="row">
                </HeaderTemplate>
                <ItemTemplate>
                    <div id="cardLibros" class="card">
                        <h5 class="card-title"><%# Eval("Titulo")%></h5>
                        <img src="<%# Eval("Portada")%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title"><%# Eval("ISBN")%></h6>
                            <h6 class="card-title"><%# Eval("Autor")%></h6>
                            <p class="card-text"><%# Eval("Descripcion")%></p>
                            <p class="card-text"><%# Eval("FechaRegistro")%></p>
                            <button id="btnFav" class="btn btn-primary" runat="server" onserverclick="btnFav_ServerClick">Favorito</button>
                            <a href="Compra.aspx?ISBN=<%# Eval("ISBN")%>" class="btn btn-primary">Cómpralo ya! por $<%# Eval("Precio")%> !</a>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    
                    </div>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
             
          <%--OFFCANVA--%>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div id="offCanvaHeader" class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">Login</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="card" id="cardLogin" runat="server">
                    <div class="card-body">
                        <div class="form-group">
                            <label class="form-label mt-4">Login</label>
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
                        <button id="btnLogin" class="btn btn-primary" runat="server" onserverclick="btnLogin_ServerClick">Login</button>
                        <a class="nav-link" href="SignUp.aspx">SignUp</a>
                    </div>
                </div>
                <div hidden="hidden" id="cardUser" runat="server">
                    <div class="form-group">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <div class="row">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                        alt="Generic placeholder image" class="img-fluid"
                                        style="width: 180px; border-radius: 10px;" />
                                    <div class="row">
                                        <h5 id="lblName" runat="server" class="mb-1"></h5>
                                        <div class="d-flex pt-1">
                                            <button type="button" class="btn btn-outline-primary me-1 flex-grow-1">View profile</button>
                                            <button type="button" class="btn btn-primary flex-grow-1">Logout</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                </div>
            </div>
         </div>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvaFav" aria-labelledby="offcanvasFavLabel">
            <div id="offCanvaFavHeader" class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasFavLabel">Favoritos</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div class="card" id="Favorito" runat="server">
                    <div class="card-body">  
                        <asp:Repeater ID="repFav" runat="server">
                <HeaderTemplate>
                    <div class="container">
                        <div class="row">
                </HeaderTemplate>
                <ItemTemplate>
                    <div id="cardLibros" class="card">
                        <h5 class="card-title"><%# Eval("Titulo")%></h5>
                        <img src="<%# Eval("Portada")%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title"><%# Eval("Autor")%></h6>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate></div>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
                <div hidden="hidden" id="Div2" runat="server">
                    <div class="form-group">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body p-4">
                                <div class="row">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                        alt="Generic placeholder image" class="img-fluid"
                                        style="width: 180px; border-radius: 10px;" />
                                    <div class="row">
                                        <h5 id="H1" runat="server" class="mb-1"></h5>
                                        <div class="d-flex pt-1">
                                            <button type="button" class="btn btn-outline-primary me-1 flex-grow-1">View profile</button>
                                            <button type="button" class="btn btn-primary flex-grow-1">Logout</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div hidden="hidden" id="Div3" runat="server">
                </div>
            </div>
         </div>
           
        </div>
         
    </form>
</body>
</html>