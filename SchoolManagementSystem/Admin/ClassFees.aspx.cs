using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;


namespace SchoolManagementSystem.Admin
{
    public partial class ClassFees : System.Web.UI.Page
    {
        Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                GetClass();
                GetFees();
            }
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over (Order by(Select 1)) as [Sr.No], ClassId, ClassName from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * from Fees where ClassID = '" + ddlClass.SelectedItem.Value+ "'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Fees Values('"+ddlClass.SelectedItem.Value+ "','"+ txtFeeAmounts.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Sucesfully!";
                    lblMsg.CssClass = "alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtFeeAmounts.Text = string.Empty;
                    GetFees();


                }
                else
                {
                    lblMsg.Text = "Entered Fees already exits for <b>'"+classVal+" '</b>!";
                    lblMsg.CssClass = "alert-danger";
                }
                
            }
            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }
        private void GetFees()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over (Order by(Select 1)) as [Sr.No], f.FeesId, f.ClassId, c.ClassName, 
                                    f.FeesAmount from Fees f inner join Class c on c.ClassId = f.ClassId");
            gvClassFees.DataSource = dt;
            gvClassFees.DataBind();
        }

        protected void gvClassFees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClassFees.PageIndex = e.NewPageIndex;
            GetFees();
        }

        protected void gvClassFees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvClassFees.EditIndex = -1;
            GetFees();
        }

        protected void gvClassFees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int FeesId = Convert.ToInt32(gvClassFees.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Fees where FeesId = '" + FeesId + "'");
                lblMsg.Text = "Fees Delete Sucesfully!";
                lblMsg.CssClass = "alert alert-success";
                gvClassFees.EditIndex = -1;
                GetFees();
            }

            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }

        }

        protected void gvClassFees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvClassFees.EditIndex = e.NewEditIndex;
            GetFees();
        }

        protected void gvClassFees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                GridViewRow row = gvClassFees.Rows[e.RowIndex];
                int FeesId = Convert.ToInt32(gvClassFees.DataKeys[e.RowIndex].Values[0]);
                string feesAmt = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Fees set FeesAmount ='" + feesAmt + "' where FeesId='"+FeesId+"'");
                lblMsg.Text = "Fees Updated Sucesfully!";
                lblMsg.CssClass = "alert alert-success";
                gvClassFees.EditIndex = -1;
                GetFees();

            }
            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }

        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {

        }
    }
}