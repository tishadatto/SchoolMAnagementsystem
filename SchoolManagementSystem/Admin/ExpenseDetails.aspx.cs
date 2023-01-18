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
    public partial class ExpenseDetails : System.Web.UI.Page
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
                GetExpenseDetails();
            }
        }

        private void GetExpenseDetails()
        {
            DataTable dt = fn.Fetch(@"Select Row_Number() over(Order by (Select 1)) as [Sr.No], e.ExpenseId, e.ClassId, c.ClassName, e.SubjectId,
                                    s.SubjectName, e.ChargeAmount from Expense e inner join Class c on e.ClassId = c.ClassId
                                    inner join Subject s on e.SubjectId = s.SubjectId ");
            gvExpenseDetails.DataSource = dt;
            gvExpenseDetails.DataBind();
        }

        //protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        //protected void gvExpenseDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{

        //}

        //protected void gvExpenseDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{

        //}

        //protected void gvExpenseDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        //{

        //}

        //protected void gvExpenseDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{

        //}

        //protected void gvExpenseDetails_RowEditing(object sender, GridViewEditEventArgs e)
        //{

        //}

        //protected void ddlClassgv_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
    }
}