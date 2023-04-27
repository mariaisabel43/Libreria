<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Libreria.Views.Compra" %>

<!DOCTYPE html>

<body>
    <asp:Repeater ID="repCarrito" runat="server">
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
                            <p class="card-text"><%# Eval("Descripcion")%></p>
                            <p class="card-text"><%# Eval("FechaRegistro")%></p>
                            <a href="Compra.aspx?id=<%# Eval("ISBN")%>" class="btn btn-primary">Cómpralo ya! por $<%# Eval("Precio")%> !</a>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    
                    </div>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
<div class="row mt-5 pt-5 p-2">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <div class="product-details mr-2">
                        <div class="d-flex justify-content-between">
                            <span class="ml-2">Detalle Compra</span>
                            
                        </div>
                        <hr class="mt-2 mb-2">
                        <div class="justify-content-start mb-2">
                            Tienes <span id="cantidad-articulos" class="ml-1">0</span> artículo(s) en tu carrito
                        </div>
                        <div id="productos-seleccionados">

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="row">

                                <div class="col-12">
                                    <div class="payment-info">
                                        <div class="d-flex justify-content-between align-items-center"><span>Detalle de Tarjeta</span></div>
                                        <span class="type d-block mt-3 mb-1">Tipo de tarjeta</span>
                                        <label class="radio"> <input type="radio" name="card" value="payment" checked></label>
                                        <label class="radio ml-2"> <input type="radio" name="card" value="payment"></label>
                                        <div>
                                            <label class="credit-card-label mb-1 mt-2">Nombre del Titular</label>
                                            <input type="text" class="form-control credit-inputs" placeholder="Nombre" id="trj_nombre">
                                        </div>
                                        <div>
                                            <label class="credit-card-label mb-1 mt-2">Número de tarjeta</label>
                                            <input type="text" class="form-control credit-inputs" placeholder="0000 0000 0000 0000" id="trj_numero">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="credit-card-label mb-1 mt-2">Vigencia</label>
                                                <input type="text" class="form-control credit-inputs" placeholder="12/24" id="trj_vigencia">
                                            </div>
                                            <div class="col-md-6">
                                                <label class="credit-card-label mb-1 mt-2">CVV</label>
                                                <input type="text" class="form-control credit-inputs" placeholder="342" id="trj_cvv">
                                            </div>
                                        </div>
                                        <hr class="line">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

<!--MODAL-->

<div class="modal fade" id="mdprocesopago" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Datos para envio</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-1">
                        <label for="recipient-name" class="col-form-label pt-0">Email:</label>
                        <input type="text" class="form-control credit-inputs" placeholder="Miad@gmail.com" id="env_email">
                    </div>
                    <div class="mb-1">
                        <label for="recipient-name" class="col-form-label">Provincia:</label>
                        <input type="text" class="form-control credit-inputs" placeholder="San José" id="env_provincia">
                    </div>
                    <div class="mb-1">
                        <label for="recipient-name" class="col-form-label">Postal:</label>
                        <input type="text" class="form-control credit-inputs" placeholder="578986" id="env_postal">
                    </div>
                    <div class="mb-1">
                        <label for="message-text" class="col-form-label">Telefono:</label>
                        <input type="text" class="form-control credit-inputs" placeholder="8395 6192" id="env_telefono">
                    </div>
                    <div class="mb-1">
                        <label for="message-text" class="col-form-label">Direccion:</label>
                        <input type="text" class="form-control credit-inputs" placeholder="Contiguo escuela Bella Vista" id="env_direccion">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="Libreria.aspx" onclick="btnSignUp_ServerClick">Confirmar pago</a>
            </div>
        </div>
    </div>
</div>
</body>  
