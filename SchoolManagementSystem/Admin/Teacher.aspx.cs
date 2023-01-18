using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagementSystem.Models.CommonFn;
using System.Data;
namespace SchoolManagementSystem.Admin
{
    public partial class Teacher : System.Web.UI.Page
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
                GetTeacher();
            }
        }
        void GetTeacher()
        {
            DataTable dt = fn.Fetch("Select Row_NUMBER() over(Order by(Select 1)) as [Sr.No], TeacherId, [name], DOB, Gender, Mobile, Email, Address, Password from Teacher");
            gvTeacher.DataSource = dt;
            gvTeacher.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
              if(ddlGender.SelectedValue != "0")
                {
                    string email = txtEmail.Text.Trim();
                    DataTable dt = fn.Fetch("select * from teacher where email = '" + email + "'");
                    if (dt.Rows.Count == 0)
                    {
                        string query = "insert into Teacher values('" + txtName.Text + "','" + txtDoB.Text + "','" + ddlGender.SelectedValue + "','" + txtMobile.Text + "','" + txtEmail.Text + "','" + txtAddress.Text + "','" + txtPassword.Text + "')";
                        fn.Query(query);
                        lblMsg.Text = "Inserted Sucesfully!";
                        lblMsg.CssClass = "alert-success";
                        Clear();
                        GetTeacher();
                    }
                    else
                    {
                        lblMsg.Text = "Entered  <b>'" + email + " '</b>!";
                        lblMsg.CssClass = "alert-danger";
                    }
                }
                else
                {
                    lblMsg.Text = "Gender is required!";
                    lblMsg.CssClass = "alert-danger";
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
            txtDoB.Text= string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;

            txtAddress.Text = string.Empty;
            txtPassword.Text = string.Empty;
            


        }

        protected void gvTeacher_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int teacherId = Convert.ToInt32(gvTeacher.DataKeys[e.RowIndex].Values[0]);
            fn.Query("Delete from Teacher where TeacherId = '" + teacherId + "'");
            lblMsg.Text = "Teacher Delete Sucesfully!";
            lblMsg.CssClass = "alert alert-success";
            gvTeacher.EditIndex = -1;
            GetTeacher();
        }

        protected void gvTeacher_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                GridViewRow row = gvTeacher.Rows[e.RowIndex];
                int teacherId = Convert.ToInt32(gvTeacher.DataKeys[e.RowIndex].Values[0]);
                string name = (row.FindControl("txtName") as TextBox).Text;
                string mobile = (row.FindControl("txtMobile") as TextBox).Text;
              
                string password = (row.FindControl("txtPassword") as TextBox).Text;
                string address = (row.FindControl("txtAddress") as TextBox).Text;
               

                fn.Query("Update Teacher set Name ='" + name + "',mobile='"+mobile+ "', Password='"+ password + "' add address='"+address+ "' where TeacherId='" + teacherId + "'");
                lblMsg.Text = "Teacher Updated Sucesfully!";
                lblMsg.CssClass = "alert alert-success";
                gvTeacher.EditIndex = -1;
                GetTeacher(); 

            }
            catch (Exception ex)

            {
                Response.Write("<script>('" + ex.Message + "');</script>");

            }
        }

        protected void gvTeacher_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTeacher.EditIndex = e.NewEditIndex;
            GetTeacher();

        }

        protected void gvTeacher_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTeacher.EditIndex = -1;
            GetTeacher();
        }

        protected void gvTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTeacher.PageIndex = e.NewPageIndex;
            GetTeacher();
        }
    }
}