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
    public partial class Subject : System.Web.UI.Page
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
                GetSubject();
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
                DataTable dt = fn.Fetch("Select * from Subject where ClassID = '" + ddlClass.SelectedItem.Value + "'and SubjectName = '"+txtSubject.Text.Trim()+"' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Subject Values('" + ddlClass.SelectedItem.Value + "','" + txtSubject.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Sucesfully!";
                    lblMsg.CssClass = "alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtSubject.Text = string.Empty;
                    GetSubject();


                }
                else
                {
                    lblMsg.Text = "Entered Subject already exits for <b>'" + classVal + " '</b>!";
                    lblMsg.CssClass = "alert-danger";
                }

            }
            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }
        private void GetSubject()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over (Order by(Select 1)) as [Sr.No], s.SubjectId, s.ClassId, c.ClassName, 
                                    s.SubjectName from Subject s inner join Class c on c.ClassId = s.ClassId");
            gvSubject.DataSource = dt;
            gvSubject.DataBind();
        }

        protected void gvSubject_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSubject.PageIndex = e.NewPageIndex;
            GetSubject(); 
        }

        protected void gvSubject_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSubject.EditIndex = -1;
            GetSubject();
        }


        protected void gvSubject_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSubject.EditIndex = e.NewEditIndex;
            GetSubject();
        }

        protected void gvSubject_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                GridViewRow row = gvSubject.Rows[e.RowIndex];
                int subjId = Convert.ToInt32(gvSubject.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)gvSubject.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
                string subjName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Subject set ClassId ='" + classId + "', SubjectName ='"+subjName+"'where SubjectId='" + subjId + "'");
                lblMsg.Text = "Subject Updated Sucesfully!";
                lblMsg.CssClass = "alert alert-success";
                gvSubject.EditIndex = -1;
                GetSubject();

        }
            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }
    }
}