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
    public partial class EmployeeAttendance : System.Web.UI.Page
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
                Attendance();
               
            }
        }

        private void Attendance()
        {
            DataTable dt = fn.Fetch("Select TeacherId, Name, Mobile, Email from Teacher");
            gvEmpAttendance.DataSource = dt;
            gvEmpAttendance.DataBind();
        }

        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {
            foreach( GridViewRow row in gvEmpAttendance.Rows )
            {
                int teacherId = Convert.ToInt32(row.Cells[1].Text);

                RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
                int status = 0;
                if(rb1.Checked)
                {
                    status = 1;

                }
                else if(rb2.Checked)
                {
                    status = 0;
                }

                fn.Query(@"Insert into TeacherAttendance values ('" + teacherId + "', '" + status + "'," +
                          " '" +  DateTime.Now.ToString("yyyy/MM/dd")+ "')");
                lblMsg.Text = "Inserted Succesfuly!";
                lblMsg.CssClass = "alert alert-Success";

            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }

    }
}