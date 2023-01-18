<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="SchoolManagementSystem.Admin.Marks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image: url('../Image/adc.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
      
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Add Marks</h3>

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
                      <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="subject is Required."
                          ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select subject" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                  </div>


                  <div class="col-md-12 mt-2">
                        <label for="txtRoll">Student Roll Number</label>
                        <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" placeholder="Enter Student Roll Number " Required>

                        </asp:TextBox>
              
                  </div>

                  <div class="col-md-12 mt-2">
                        <label for="txtStudMarks">Total Marks(Student Marks)</label>
                        <asp:TextBox ID="txtStudMarks" runat="server" CssClass="form-control" placeholder="Enter Total Marks"
                            TextMode="Number" Required>

                        </asp:TextBox>
              
                  </div>

                  
                  <div class="col-md-12 mt-2">
                        <label for="txtOutofMarks">Out of Marks</label>
                        <asp:TextBox ID="txtOutofMarks" runat="server" CssClass="form-control" placeholder="Enter Out of Marks"
                            TextMode="Number" Required>

                        </asp:TextBox>
              
                  </div>


               </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
              
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#333300" ForeColor="#ffffff" Text="Add Marks" OnClick="btnAdd_Click" />
                        
                </div>

             </div>

            <div class="row mb-3 mr-lg-3 ml-lg-5">
                <div class="col-md-6">
                   <asp:GridView ID="gvMarks" runat="server" CssClass= "table table-hover table-bordered" EmptyDataText = "No record to display!" 
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="gvMarks_PageIndexChanging" DataKeyNames="Id"
                        OnRowCancelingEdit="gvMarks_RowCancelingEdit"
                        OnRowEditing="gvMarks_RowEditing" OnRowUpdating="gvMarks_RowUpdating" OnRowDataBound="gvMarks_RowDataBound">
                        
                       <Columns>



                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Class">
                            <EditItemTemplate>
                                     
                                    <asp:DropDownList ID="ddlClassgv" runat="server"   DataSourceID="SqlDataSource1" DataTextField="ClassName" 
                                        DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlClassgv_SelectedIndexChanged"> 
                                    
                                    
                                    <asp:ListItem>Select Class</asp:ListItem>
                                    </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:School.CS %>' SelectCommand="SELECT" * FROM [Class]></asp:SqlDataSource>
                             </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                         </asp:TemplateField>

                             <asp:TemplateField HeaderText="Subject">
                                <EditItemTemplate>
                                    
                                    <asp:DropDownList ID="ddlSubjectgv" runat="server"  CssClass="form-control"> 
                                    </asp:DropDownList>
                                    
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Roll Number">
                                <EditItemTemplate>
                                       <asp:TextBox ID="txtrollnumbergv"  runat="server" CssClass="form-control" Text='<%# Eval("ChargeAmount") %>'>
                                       </asp:TextBox>
                                </EditItemTemplate>
                                 <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChargeAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Total Marks">
                                <EditItemTemplate>
                                       <asp:TextBox ID="txtstudentmarksgv"  runat="server" CssClass="form-control" Text='<%# Eval("ChargeAmount") %>'>
                                       </asp:TextBox>
                                </EditItemTemplate>
                                 <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChargeAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>


                             <asp:TemplateField HeaderText="Out of Marks">
                                <EditItemTemplate>
                                       <asp:TextBox ID="txtoutofmarksgv"  runat="server" CssClass="form-control" Text='<%# Eval("ChargeAmount") %>'>
                                       </asp:TextBox>
                                </EditItemTemplate>
                                 <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ChargeAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>



                            <asp:CommandField  CausesValidation="false" HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="true">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                              <HeaderStyle BackColor="Black" BorderColor="White" />
                    </asp:GridView>

                </div>
            </div>

        </div>
     </div>
</asp:Content>
