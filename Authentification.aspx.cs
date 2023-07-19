using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 using System.Text.RegularExpressions;
using System.Data;

namespace GestionLocationVoiture
{
    public partial class Authentification : System.Web.UI.Page
    {
        BD_GestionLocationEntities3 entities = new BD_GestionLocationEntities3();
        protected void Page_Load(object sender, EventArgs e)
        {
            error.Visible = false;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
           try{
                if (Page.IsValid)
                {
                    if (entities.Administrateur.Any(a => a.Login == txtEmail.Text && a.Password == txtPass.Text))
                    {
                        var user = (from a in entities.Administrateur
                                    where a.Login == txtEmail.Text && a.Password == txtPass.Text
                                    select a).ToList().First();
                        Session["login"] = user.Login;
                        Response.Redirect("~/PageTableauBord.aspx");
                    }
                    else
                    {
                        error.Visible = true;
                        //Response.Write("<script>alert('fhgjklmhjbiyhiuy')</script>");
                    }
                }
            }catch (Exception ex) { }
           
         
        }
       

    }
}