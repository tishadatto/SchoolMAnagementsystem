using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;


namespace SchoolManagementSystem.Admin
{
    public partial class MarkDetails : System.Web.UI.Page
    {
        //Commonfnx fn = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            //if (!IsPostBack)
            //{
            //    GetClass();
            //    GetMarks();
            //}
        }

        //private void GetMarks()
        //{
        //    DataTable dt = fn.Fetch(@"Select Row_Number() OVER(ORDER BY(Select 1)) as [Sr.NO], e.ExamId, e.ClassId, c.ClassName,
        //                                     e.SubjectId, s.SubjectName, e.TotalMarks, e.OutofMarks from Exam e 
        //                                    inner join Class c on c.ClassId = e.ClassId inner join Subject s on s.SubjectId = e.SubjectId");
        //    gvMarksDetails.DataSource = dt;
        //    gvMarksDetails.DataBind();
        //}
        //private void GetClass()
        //{
        //    DataTable dt = fn.Fetch("Select Row_NUMBER() over (Order by(Select 1)) as [Sr.No], ClassId, ClassName from Class");
        //    ddlClass.DataSource = dt;
        //    ddlClass.DataTextField = "ClassName";
        //    ddlClass.DataValueField = "ClassId";
        //    ddlClass.DataBind();
        //    ddlClass.Items.Insert(0, "Select Class");
        //}

        //protected void btnAdd_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        string classId = ddlClass.SelectedValue;
        //        string rollNO = txtRoll.Text.Trim();
        //        DataTable dt = fn.Fetch(@"Select Row_Number() OVER(ORDER BY(Select 1)) as [Sr.NO], e.ExamId, e.ClassId, c.ClassName,
        //                                     e.SubjectId, s.SubjectName, e.TotalMarks, e.OutofMarks from Exam e 
        //                                    inner join Class c on c.ClassId = e.ClassId inner join Subject s on s.SubjectId = e.SubjectId
        //                                    Where e.ClassId = '" + classId + "' and e.RollNo ='" + rollNO + "'");
        //        gvMarksDetails.DataSource = dt;
        //        gvMarksDetails.DataBind();

        //    }
        //    catch (Exception ex)

        //    {
        //        Response.Write("<script>('" + ex.Message + "');</script>");

        //    }
        //}

        //protected void gvMarksDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    gvMarksDetails.PageIndex = e.NewPageIndex;
        //}
    }
}