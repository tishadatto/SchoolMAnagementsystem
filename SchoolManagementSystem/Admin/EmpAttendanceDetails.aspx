<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="EmpAttendanceDetails.aspx.cs" Inherits="SchoolManagementSystem.Admin.EmpAttendanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div style="background-image: url('../Image/adc.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                 <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Teacher Attendance Details</h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div Class="col-md-6">
                   
                      <label for="ddlClass">Class</label>
                      <label for="ddlTeacher">Teacher</label>
                      <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Teacher is Required."
                          ControlToValidate="ddlTeacher" Display="Dynamic" ForeColor="Red" InitialValue="Select Teacher" SetFocusOnError="True">
                      </asp:RequiredFieldValidator>

                </div>
               
                    <div  Class="col-md-6">
                         <label for="ddlSubject">Month</label>
                        <asp:TextBox ID="txtMonth" CssClass="form-control" runat="server" TextMode="Month" Required ></asp:TextBox>
                    </div>
               </div>

                <div class="row mb-3 mr-lg-5 ml-lg-5">
                    <div class="col-md-3 col-md-offset-2 mb-3">
                       <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#333300"
                         ForeColor="#ffffff" Text="Check Attendance" OnClick="btnCheckAttendance_Click"/>
                 </div>
                   </div>
         
            <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div  Class="col-md-12">
                    
                    <asp:GridView ID="gvEmpAtnDetails" runat="server" CssClass="table table-hover table-bordered" EmptyDataText ="No record to display!"
                        AutoGenerateColumns="false">
                        
                    <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Name" HeaderText="Name">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>

                            <%--<asp:BoundField DataField="Status" HeaderText="Status">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>--%>
                             
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Boolean.Parse( Eval("status").ToString()) ? "Present" : "Absent" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Date" HeaderText="Date" dataFormatString="{0:dd MM yyyy}">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>
                      </Columns>
                            <HeaderStyle BackColor="#5558C9" ForeColor="White">
                             
                            </HeaderStyle>
                    </asp:GridView>


                    <%--<asp:GridView ID="gvExpense" runat="server" CssClass= "table table-hover table-bordered" EmptyDataText = "No record to display!" 
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="gvExpense_PageIndexChanging" DataKeyNames="Id"
                        OnRowCancelingEdit="gvExpense_RowCancelingEdit"
                        OnRowEditing="gvExpense_RowEditing" OnRowUpdating="gvExpense_RowUpdating" OnRowDataBound="gvExpense_RowDataBound" OnRowDeleting="gvExpense_RowDeleting">
                       
                        <Columns>


                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="true">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                          
                             <asp:TemplateField HeaderText="Class">
                             <EditItemTemplate>
                                 <asp:DropDownList ID="ddlClassgv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName"
                                     DataValueField="ClassId" selectedValue='<%# Eval("ChargeAmount")%>' CssClass="form-control"
                                      AutoPostBack="true" OnSelectedIndexChanged="ddlClassgv_SelectedIndexChanged">
                                 <asp:ListItem>Select Class</asp:ListItem>
                                 </asp:DropDownList>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%# Eval("ChargeAmount")%>'
                                     SelectCommand="SELECT * FROM[Class]"></asp:SqlDataSource>
                                         
                             </EditItemTemplate> 
                                 <ItemTemplate>
                                     <asp:Label ID="Label2" runat="server" Text='<%# Eval("SubjectName")%>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                             <asp:TemplateField HeaderText="Charge Rs.(Per Lecture)">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtExpenseAmt" runat="server" CssClass="form-control" Text='<%# Eval("ChargeAmount")%>'
                                         TextMode="Number"></asp:TextBox>
                                 </EditItemTemplate>
                                    <ItemTemplate>
                                     <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChargeAmount")%>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>

                            <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="true">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>

                         
                      </Columns>
                              <HeaderStyle BackColor="Black" BorderColor="White" />
                    </asp:GridView>
--%>

                </div>
            </div>

           
       </div>
    </div>

</asp:Content>
