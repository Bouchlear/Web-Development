using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace GestionLocationVoiture
{
    public partial class PageClient : System.Web.UI.Page
    {
        BD_GestionLocationEntities3 entities = new BD_GestionLocationEntities3();
        SqlConnection cnx = new SqlConnection(@"data source=DESKTOP-J7SARAS\MSSQLSERVER01;initial catalog=BD_GestionLocation;integrated security=true ");
        SqlCommand cmd;
        public void filldatta()
        {
            try
            {
                GridViewClt.DataSource = entities.Client.ToList();
                GridViewClt.DataBind();
            }
            catch (Exception e) { }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                filldatta();
            }
        }
        protected void GridViewClt_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int pos = e.RowIndex;
            String clt = GridViewClt.DataKeys[pos].Values["CIN"].ToString();
            Client c = entities.Client.Find(clt);
            entities.Client.Remove(c);
            entities.SaveChanges();
            filldatta();

        }
        protected void GridViewClt_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "modifier")
                {
                    int comdEdit = int.Parse(e.CommandArgument.ToString());
                    cintxt.Text = ((Label)GridViewClt.Rows[comdEdit].FindControl("label1")).Text;
                    TxtNom.Text = ((Label)GridViewClt.Rows[comdEdit].FindControl("label2")).Text;
                    TxtPrenom.Text = ((Label)GridViewClt.Rows[comdEdit].FindControl("label3")).Text;
                    TxtTel.Text = ((Label)GridViewClt.Rows[comdEdit].FindControl("label4")).Text;
                    TxtEmail.Text = ((Label)GridViewClt.Rows[comdEdit].FindControl("label5")).Text;
                    txtDateP2.Text = Convert.ToDateTime(DateTime.ParseExact(((Label)GridViewClt.Rows[comdEdit].FindControl("label6")).Text, "dd/MM/yyyy HH:mm:ss", CultureInfo.InvariantCulture)).ToString("yyyy-MM-dd");
                   // txtDateP2.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    ModalPopupExtender2.Show();
                }
            }
            catch (Exception ex) { }
        }
        protected void btnAjouterClt_Click(object sender, EventArgs e)
        {

            cmd = new SqlCommand("AjouterClient", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cin", txtCIN.Text);
            cmd.Parameters.AddWithValue("@nomC", TextNom.Text);
            cmd.Parameters.AddWithValue("@prenomC", TextPrenom.Text);
            cmd.Parameters.AddWithValue("@tel", Int32.Parse(TextTel.Text));
            cmd.Parameters.AddWithValue("@email", TextEmail.Text);
            cmd.Parameters.AddWithValue("@DatePermis", txtdate.Text);
            cnx.Open();
            cmd.ExecuteNonQuery();
            cnx.Close();
            Response.Write("<script>alert('Bien Ajouter!')</script>");
            filldatta();
        }
        protected void btnmodifer_Click(object sender, EventArgs e)
        {
            try
            {
                cmd = new SqlCommand("ModifierClient", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cin", cintxt.Text);
                cmd.Parameters.AddWithValue("@nomC", TxtNom.Text);
                cmd.Parameters.AddWithValue("@prenomC", TxtPrenom.Text);
                cmd.Parameters.AddWithValue("@tel", Int32.Parse(TxtTel.Text));
                cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                cmd.Parameters.AddWithValue("@DatePermis", DateTime.Parse(txtDateP2.Text));
                cnx.Open();
                cmd.ExecuteNonQuery();
                cnx.Close();
                filldatta();
            }
            catch (Exception ex) { }

        }
    }
}