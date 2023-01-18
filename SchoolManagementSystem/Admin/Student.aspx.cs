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
    public partial class Student : System.Web.UI.Page
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
                GetStudent();


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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlGender.SelectedValue != "0")
                {
                    string rollNo = txtRoll.Text.Trim();
                    DataTable dt = fn.Fetch("Select * from Student Where ClassId ='" + ddlClass.SelectedValue + "' and RollNo = '" + rollNo + "'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "Insert into Student Values ('" + txtName.Text.Trim() + "', '" + txtDoB.Text.Trim() + "'," +
                            "'" + ddlGender.SelectedValue + "', '" + txtMobile.Text.Trim() + "', " +
                            "'" + txtRoll.Text.Trim() + "', '" + txtAddress.Text.Trim() + "','" + ddlClass.SelectedValue + "') ";
                        fn.Query(query);
                        lblMsg.Text = "Inserted Succesfully!";
                        lblMsg.CssClass = "alert alert-sucess";
                        Clear();
                        GetStudent();
                    }
                    else
                    {
                        lblMsg.Text = "Entered Roll No. <b>'" + rollNo + "'</b> already exists for selected Class!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Gender is required!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }


            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }

        } 
        void Clear()
        {
            ddlGender.SelectedIndex = 0;
            txtName.Text = string.Empty;
            txtDoB.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtRoll.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlClass.SelectedValue = string.Empty;

        }
        private void GetStudent()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by(Select 1)) as [Sr.No], s.StudentId, s.[name], " +
                "s.[DOB], s.[Gender], s.[Mobile], s.[RollNo], s.[Address], c.ClassId, c.ClassName from Student s inner join Class c on c.ClassId = s.ClassId");
            gvStudent.DataSource = dt;
            gvStudent.DataBind();
        }

        protected void gvStudent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudent.PageIndex = e.NewPageIndex;
            GetStudent();
        }

        protected void gvStudent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvStudent.PageIndex = -1;
            GetStudent();
        }

        protected void gvStudent_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvStudent.EditIndex = e.NewEditIndex;
            GetStudent();
        }

        protected void gvStudent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                GridViewRow row = gvStudent.Rows[e.RowIndex];
                int StudentId = Convert.ToInt32(gvStudent.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string mobile = (row.FindControl("txtmobile") as TextBox).Text;
                string rollNo = (row.FindControl("txtrollNo") as TextBox).Text;
                string address = (row.FindControl("txtaddress") as TextBox).Text;
                String classId = ((DropDownList)gvStudent.Rows[e.RowIndex].Cells[4].FindControl("ddlClass")).SelectedValue;
                fn.Query(@"Update Student set Name = '" + name.Trim() + "',Mobile='" + mobile.Trim() + "', Address = '" + address.Trim() + "', " +
                    "RollNo='" + rollNo.Trim() + "' , ClassId='" + classId + "' where StudentId = '" + StudentId + "' ");
                lblMsg.Text = "Student Updated Succesfully!";
                lblMsg.CssClass = "alert alert-sucess";
                gvStudent.EditIndex = -1;
                GetStudent();



            }

            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }

        }

        protected void gvStudent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gvStudent.EditIndex == e.Row.RowIndex)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClass");
                    DataTable dt = fn.Fetch("Select * from Class");
                    ddlClass.DataSource = dt;
                    ddlClass.DataTextField = "ClassName";
                    ddlClass.DataValueField = "ClassId";
                    ddlClass.DataBind();
                    ddlClass.Items.Insert(0, "Select Class");
                    string selectedClass = DataBinder.Eval(e.Row.DataItem, "ClassName").ToString();
                    ddlClass.Items.FindByText(selectedClass).Selected = true;
                }
            }
        }
    }
}

