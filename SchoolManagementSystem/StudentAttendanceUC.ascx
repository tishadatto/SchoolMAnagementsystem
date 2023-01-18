<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendanceUC.ascx.cs" Inherits="SchoolManagementSystem.StudentAttendanceUC" %>

<div style="background-image: url(' '); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            
            <h3 class="text-center text-dark">Student's Attendance Details</h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

                  <div class="col-md-6">
                    <label for="ddlClass">Class</label>
                      <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required."
                          ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                  </div>

                  

                   <div class="col-md-6">
                    <label for="ddlSubject">Subject</label>
                      <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" placeholder="Select Subject"></asp:DropDownList>
                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="subject is Required."
                          ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select subject" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>--%>
                     </div>

                </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

                  <div class="col-md-6">
                    <label for="ddlClass">Roll Number</label>
                      <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" placeholder="Enter Student Roll NO"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RollNO is Required."
                          ControlToValidate="txtRollNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                  </div>

                
                   <div class="col-md-6">
                    <label for="txtMonth">Month</label>
                     <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Month"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month is Required."
                          ControlToValidate="txtMonth" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                     </div>
                 </div>

              <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
              
                    <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block"
                       OnClick="btnCheckAttendance_Click" BackColor="#333300" Text="Check Attendance"/>
                        
                 </div>
              </div>

             <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div  Class="col-md-12">
                <asp:GridView ID="gvStdAtnDetails" runat="server" CssClass="table table-hover table-bordered" EmptyDataText ="No record to display!"
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
               </div>
          </div>

     </div>

</div>