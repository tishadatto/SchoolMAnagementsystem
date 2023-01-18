<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ExpenseDetails.aspx.cs" Inherits="SchoolManagementSystem.Admin.ExpenseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 720%px;
            margin-bottom: 0;
        }
    </style>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style ="background-image: url('../Image/bg.jpg'); background-repeat: no-repeat; background-size: cover; background-attachment: fixed;" class="auto-style1">
        <div class="container p-md-4 p-sm-4">
            <%--<div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>--%>
              <h3 class="text-center"> Expense Details </h3>

                  <%--<div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                      <div class="col-md-6">
                          <label for="ddlClass">Class</label>
                              <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true"
                                  OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required."
                            ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">
                              </asp:RequiredFieldValidator>

                      </div>

                      <div Class="col-md-6">
                          <label for="ddlSubject">Subject</label>
                          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is Required."
                            ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select Subject" SetFocusOnError="True">
                              </asp:RequiredFieldValidator>
                      </div>


                      <div Class="col-md-6 mt-2">
                          <label for="txtExpenseAmt">Charge Amount(Per Lecture)</label>
                          <asp:TextBox ID="txtExpenseAmt" runat="server" CssClass="form-control"PlaceHolder="Enter Charge Amount"
                              TextMode="Number" required></asp:TextBox>
                      </div>

                  </div>

               <div class="row mb-3 mr-lg-3 ml-lg-5">
                   <div class="col-md-3 col-md-offset-2 mb-3">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Expense"
                             OnClick="btnAdd_Click" />

                   </div>


               </div>--%>



            <div class="row mb-3 mr-3 mr-lg-5 ml-lg-5">
                <div class="col-md-12">

                    <asp:GridView ID="gvExpenseDetails" runat="server" CssClass="table table-hover table-bordered" EmptyDataText ="No record to display!"
                        AutoGenerateColumns="false">
                        
                    <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="ClassName" HeaderText="Class">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="SubjectName" HeaderText="Subject">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="ChargeAmount" HeaderText="Charge Amt(Per Lecture)">
                            <ItemStyle HorizontalALign="Center" />
                            </asp:BoundField>

                            

                            <%--<asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                    <asp:DropDownList ID ="ddlClassgv" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName"
                                        DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlClassgv_SelectedIndexChanged">
                                        <asp:ListItem>Select Class</asp:ListItem>
                                    </asp:DropDownList>
                                         <asp:SqlDataSource ID ="SqlDataSource1" runat="server" ConnectionString="<%$ConnectionStrings:SchoolCS%>"
                                               SelectCommand=" SELECT * FROM [Class]"></asp:SqlDataSource>
                                 </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID ="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                     <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Subject">
                                       <asp:DropDownList ID ="ddlSubjectgv" runat="server" CssClass="form-control"></asp:DropDownList>

                                      <EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName")%>'></asp:Label>
                                           </ItemTemplate>
                                               <ItemStyle HorizontalAlign="Center" />
                                      </EditItemTemplate>
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

                            <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="true" ShowDeleteButton="true">
                                
                                  <ItemStyle HorizontalAlign="Center" />

                            </asp:CommandField>--%>

                        </Columns>
                            <HeaderStyle BackColor="#5558C9" ForeColor="White">
                             
                            </HeaderStyle>
                    </asp:GridView>


                   
                        

                </div>

           </div>
              
        </div>



    </div>


</asp:Content>

