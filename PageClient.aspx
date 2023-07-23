<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PageClient.aspx.cs" Inherits="GestionLocationVoiture.PageClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <style>
         @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css");
       
        .bgstylepopup {
            background-color: black;
            opacity: 0.5;
        }
        .textPop{
            font-size:20px;
        }
         .bgstylepopup{
            background-color:black;
           opacity: 0.5;
        }
          .styleboxpop{
            width:300px;
            height:40px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="margin-top:80px;width:500px;" class="container">
         <div style="width:1100px;" >
             <div class="mb-4 mt-4">
                 <asp:Label runat="server" Text="Client" Class="h3"></asp:Label>
                   <div class="navbar"style="float:right;">
                        <span style="width:40px;"> </span>
                       <asp:LinkButton ID="btnNouvClt" runat="server" CssClass="bg-info border-0 text-white show btnNouveauClient p-2" ><i class="fa fa-plus "></i> Nouveau Client</asp:LinkButton>
                    </div> 
             </div>
                 <asp:GridView ID="GridViewClt" runat="server" AutoGenerateColumns="False" CssClass="w-100 mt-4" CellPadding="9" ForeColor="#333333" GridLines="None" DataKeyNames="CIN" OnRowDeleting="GridViewClt_RowDeleting"  OnRowCommand="GridViewClt_RowCommand">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         <asp:TemplateField HeaderText="CIN">
                             <EditItemTemplate>
                                 <asp:TextBox ID="txtCIN" runat="server" Text='<%# Bind("CIN") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("CIN") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Nom">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextNom" runat="server" Text='<%# Bind("Nom_Client") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nom_Client") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Prénom">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextPrenom" runat="server" Text='<%# Bind("Prenom_Client") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label3" runat="server" Text='<%# Bind("Prenom_Client") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Téléphone">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextTel" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Email">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Date Pérmis">
                             <EditItemTemplate>
                                 <asp:TextBox ID="Calendar1" runat="server" Text='<%# Bind("Date_Permis") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("Date_Permis") %>'></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                 <asp:LinkButton ID="btnDelete" runat="server" CommandName="delete" onClientClick="return fnConfirmDelete();"><i class=" bi-trash3 border-0"></i></asp:LinkButton>
                                 <asp:LinkButton ID="btnUpdate" runat="server"  CommandName="modifier" CommandArgument='<%# DataBinder.Eval(Container,"RowIndex") %>'>&nbsp; &nbsp;<i class=" bi-pencil  border-0  "></i></asp:LinkButton>
                                </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                 </asp:GridView>

                 <%-- PopUp button ajouter client--%>
                 <asp:ScriptManager ID="ScriptManagerClt1" runat="server"></asp:ScriptManager>
                 <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  CancelControlID="btncancel1" TargetControlID="btnNouvClt" PopupControlID="Panel1" BackgroundCssClass="bgstylepopup"></ajaxToolkit:ModalPopupExtender>
                 <asp:Panel ID="Panel1" runat="server" Width="600" Height="650" CssClass="text-center">
                     <div class="card px-3 " >
                     <div class="card-body  ">
                        <h2 class="text-dark px-2 py-2 text-capitalize">Ajouter Client</h2>
                        <div class="form-group row py-2">
                            <div class="col-md-4 textPop">CIN</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtCIN" runat="server" class="styleboxpop"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Nom</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextNom" runat="server" class="styleboxpop" ></asp:TextBox>
                            </div>
                        </div>
                           <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Prénom</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextPrenom" runat="server" class="styleboxpop" ></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Télephone</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextTel" runat="server" class="styleboxpop"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Email</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TextEmail" runat="server" class="styleboxpop" ></asp:TextBox>
                            </div>
                        </div>
                           <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Date Pérmis </div>   
                                <div class="col-md-4">
                                   <asp:TextBox ID="txtdate" runat="server" TextMode="Date" CssClass="styleboxpop"></asp:TextBox>
                              <%--   <asp:TextBox ID="TextBox1" runat="server" class="styleboxpop" AutoCompleteType="da" ></asp:TextBox>--%>
                            </div>
                        </div>
                       
                        </div>
                        <hr  width="95%"/>
                        <div class="form-group row py-2  d-flex flex-row-reverse  ml-5 ">
                             <asp:Button ID="btncancel1" runat="server" Text="cancel" CssClass=" btn btn-danger btnPopup w-25" />
                            <asp:Button ID="btnAjouterClt" runat="server" Text="Ajouter" CssClass="btn btn-success btnPopup mr-3 w-25" OnClick="btnAjouterClt_Click"/>
                        </div>
                    </div>
                     </asp:Panel>
             <%-- PopUp button  modifier client--%>
                <asp:Button ID="sowpopup" runat="server" Style="display:none;"/>
              <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server"  BackgroundCssClass="bgstylepopup" CancelControlID="btncancel" TargetControlID="sowpopup" PopupControlID="Panel2"></ajaxToolkit:ModalPopupExtender>
              <asp:Panel ID="Panel2" runat="server" Width="600" Height="600" CssClass="text-center">
                   <div class="card px-3 " >
                     <div class="card-body  ">
                        <h2 class="text-dark px-2 py-2 text-capitalize">Modifier Client</h2>
                        <div class="form-group row py-2">
                            <div class="col-md-4 textPop">CIN</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="cintxt" runat="server" class="styleboxpop" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Nom</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TxtNom" runat="server" class="styleboxpop"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Prénom</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TxtPrenom" runat="server" class="styleboxpop"></asp:TextBox>
                            </div>
                        </div>
                         <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Télephone</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TxtTel" runat="server" class="styleboxpop"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Email</div>
                            <div class="col-md-4">
                                <asp:TextBox ID="TxtEmail" runat="server" class="styleboxpop"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group row py-2">
                            <div class="col-md-4 textPop">Date Pérmis </div>   
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtDateP2" runat="server" TextMode="DateTime" CssClass="styleboxpop"></asp:TextBox>    
                            </div>
                        </div>
                        <hr  width="95%"/>
                        <div class="form-group row py-2  d-flex flex-row-reverse  ml-5 ">
                             <asp:Button ID="btncancel" runat="server" Text="cancel" CssClass=" btn btn-danger btnPopup w-25" />
                            <asp:Button ID="btnmodifer" runat="server" Text="Modifier" CssClass="btn btn-success btnPopup mr-3 w-25"  OnClick="btnmodifer_Click"/>
                        </div>
                    </div>
                 </div>
               </asp:Panel>
               <asp:HiddenField ID="HiddenField1" runat="server" />
               </div>
          </div>
      <script language="javascript" type="text/javascript">
         function fnConfirmDelete() {
             return confirm("Êtes-vous sûr de vouloir supprimer ceci ?");
         }
      </script>
</asp:Content>
