using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using static SchoolManagementSystem.Models.CommonFn;
namespace SchoolManagementSystem.Admin
{
    public partial class Expense : System.Web.UI.Page
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
                GetExpense();
                //GetTeacherSubject();
            }
        }


        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }
        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ClassId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("Select * from Subject where classId ='" + ClassId + "'");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "SubjectName";
            ddlClass.DataValueField = "SubjectId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Subject");

        }
        private void GetExpense()
        {
            DataTable dt = fn.Fetch(@"Select Row_Number() over(Order by (Select 1)) as [Sr.No], e.ExpenseId, e.ClassId, c.ClassName, e.SubjectId,
                                    s.SubjectName, e.ChargeAmount from Expense e inner join Class c on e.ClassId = c.ClassId
                                    inner join Subject s on e.SubjectId = s.SubjectId ");
            gvExpense.DataSource = dt;
            gvExpense.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {

            try
            {
                string classId = ddlClass.SelectedValue;
                string subjectId = ddlSubject.SelectedValue;
                string chargeAmt = txtExpenseAmt.Text.Trim();
                DataTable dt = fn.Fetch("Select * from Expense where ClassId ='" + classId +
                    "' and SubjectId ='" + subjectId + "' and ChargeAmount ='" + chargeAmt + "'");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Expense values('" + classId + "','" + subjectId + "','" + chargeAmt + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-succesfully";
                    ddlClass.SelectedIndex = 0;
                    ddlSubject.SelectedIndex = 0;
                    GetExpense();

                }
                else
                {
                    lblMsg.Text = "Entered <b>Data</b> already exists!";
                    lblMsg.CssClass = "alert alert-danger";

                }



            }


            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }

        protected void gvExpense_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvExpense.PageIndex = e.NewPageIndex;
            GetExpense();
        }

        protected void gvExpense_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvExpense.PageIndex = -1;
            GetExpense();
        }

        protected void gvExpense_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int expenseId = Convert.ToInt32(gvExpense.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Expense where ExpenseId ='" + expenseId + "'");
                lblMsg.Text = "Expense Deleted Succesfully!";
                lblMsg.CssClass = "alert alert-success";
                gvExpense.EditIndex = -1;
                GetExpense();
            }
            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }


        protected void gvExpense_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvExpense.EditIndex = e.NewEditIndex;
            GetExpense();
        }

        protected void gvExpense_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {

                GridViewRow row = gvExpense.Rows[e.RowIndex];
                int expenseId = Convert.ToInt32(gvExpense.DataKeys[e.RowIndex].Values[0]);
                String classId = ((DropDownList)gvExpense.Rows[e.RowIndex].Cells[2].FindControl("ddlClassgv")).SelectedValue;
                String subjectId = ((DropDownList)gvExpense.Rows[e.RowIndex].Cells[2].FindControl("ddlsubjectgv")).SelectedValue;
                string chargeAmt = (row.FindControl("txtExpenseAmt") as TextBox).Text.Trim();
                fn.Query(@"Update Expense set ClassId = '" + classId + "',SubjectId='" + subjectId + "', ChargeAmount = '" + chargeAmt + "' " +
                    " where ExpenseId =' " + expenseId + " ' ");
                lblMsg.Text = "Record Updated Succesfully!";
                lblMsg.CssClass = "alert alert-sucess";
                gvExpense.EditIndex = -1;
                GetExpense();



            }

            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }

        }
        protected void ddlClassgv_SelectedIndextChanged(object sender, EventArgs e)


        {
            DropDownList ddlClassgv = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlClassgv.NamingContainer;
            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlSubjectgv = (DropDownList)row.FindControl("ddlSubjectgv");
                    DataTable dt = fn.Fetch("Select * from Expense where ClassId ='" + ddlClassgv.SelectedValue + "' ");
                    ddlSubjectgv.DataSource = dt;
                    ddlSubjectgv.DataTextField = "SubjectName";
                    ddlSubjectgv.DataValueField = "SubjectId";
                    ddlSubjectgv.DataBind();
                }
            }
        }

        protected void gvExpense_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if((e.Row.RowState & DataControlRowState.Edit)>0)
                {
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClassgv");
                    DropDownList ddlSubject= (DropDownList)e.Row.FindControl("ddlSubjectgv");
                    DataTable dt = fn.Fetch("Select * from Subject where ClassId = '" + ddlClass.SelectedValue + "'");
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectName";
                    ddlSubject.DataValueField = "SubjectId";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, "Select Subject");
                    string selectedSubject = DataBinder.Eval(e.Row.DataItem, "SubjectName").ToString();
                    ddlSubject.Items.FindByText(selectedSubject).Selected = true;
                    //string expenseId = gvExpense.DataKeys[e.Row.RowIndex].Value.ToString();
                    //DataTable dataTable = fn.Fetch(@"Select e.ExpenseId, e.ClassId, e.SubjectId, s.SubjectName from expense e inner 
                    //                        join Subject s on e.SubjectId = s.SubjectId where eExpenseId = '"+ expenseId +"'");
                    //ddlSubject.SelectedValue = dataTable.Rows[0]["SubjectId"].ToString();

                }
            }
        }
    }


}

