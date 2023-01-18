using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;

namespace SchoolManagementSystem.Admin
{
    public partial class AddClass : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["admin"] == null )
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                GetClass();
            }
          
        }
       private void GetClass()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No],ClassID,ClassName from Class");
            gvClass.DataSource = dt;
            gvClass.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = fn.Fetch("Select * from class where ClassName = '" + txtClass.Text.Trim() + "'");
                if (dt.Rows.Count==0)
                {
                    string query="Insert into Class Values('"+txtClass.Text.Trim()+"')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Sucesfully!";
                    lblMsg.CssClass = "alert-success";
                    txtClass.Text = string.Empty;
                   

                }
                else
                {
                    lblMsg.Text = "data already exits!";
                    lblMsg.CssClass = "alert-danger";
                }
                GetClass();
            }
            catch(Exception ex)
            
            {
                 Response.Write("<script>('"+ex.Message+"');</script>");
               
            }
        }
        protected void gvClass_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClass.PageIndex = e.NewPageIndex;
            GetClass();
        }
        protected void gvClass_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvClass.EditIndex = -1;
            GetClass();
        }
        protected void gvClass_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvClass.EditIndex = e.NewEditIndex;
        }
        protected void gvClass_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {


                GridViewRow row = gvClass.Rows[e.RowIndex];
                int cId = Convert.ToInt32(gvClass.DataKeys[e.RowIndex].Values[0]);
                string ClassName = (row.FindControl("txtClassEdit") as TextBox).Text;
                fn.Query("Update Class set ClassName = '" + ClassName + "' where ClassId = '" + cId + "'" );
                lblMsg.Text = "Class Update Sucesfully!";
                lblMsg.CssClass = "alert alert-success";
                gvClass.EditIndex = -1;
                GetClass();

            }

            catch (Exception ex)
            {

                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }




    }
}