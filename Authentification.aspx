<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authentification.aspx.cs" Inherits="GestionLocationVoiture.Authentification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="Boostrap/bootstrap-4.5.3-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="Boostrap/bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<head runat="server">
    <title></title>
</head>
<body>
    <section class="vh-100 bg-info">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-6 col-lg-5 d-none d-md-block">
              <img src="images/imgRent.png"
                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;height:500px;width:450px;" />
            </div>
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">
                <form runat="server">
                  <div class="mb-4">
                    <img src="images/logocar.png" style="height:80px;width:120px;"/>
                  </div>
                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
                  <div class="form-outline mb-4">
                       <asp:Label ID="Label2" runat="server" class="form-label" Text="Email address"></asp:Label>
                      <asp:TextBox ID="txtEmail" runat="server" class="form-control form-control-lg"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="e-mail ne peut pas être vide" ControlToValidate="txtEmail"  CssClass="text-danger "  Display="Dynamic"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="la forma invalide" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      <asp:Label ID="error" runat="server" Text="e-mail ou le mot de passe est incorrect" class="text-danger "></asp:Label>
                  </div>
                  <div class="form-outline mb-4">
                      <asp:Label ID="Label1" runat="server" class="form-label" Text="Password"></asp:Label>
                      <asp:TextBox ID="txtPass" runat="server"  class="form-control form-control-lg" TextMode="Password" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Le mot de passe ne peut pas être vide" CssClass="text-danger " ControlToValidate="txtPass"></asp:RequiredFieldValidator><br />
                        <input type="checkbox" style="margin-top:10px ;margin-left:15px" onchange ="document.getElementById('txtPass').type = this.checked ? 'text' : 'password'"/>  Show password  
                      </div>
                  <div class="pt-1 mb-4">
                      <asp:Button ID="btnLogin" runat="server" class="btn btn-info btn-lg btn-block" Text="Login" OnClick="btnLogin_Click"  />
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>
