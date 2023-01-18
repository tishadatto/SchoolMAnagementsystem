<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="SchoolManagementSystem.Admin.Expense" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div style="background-image: url(' '); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
      
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center">Add Expense</h3>

              <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

                  <div class="col-md-6">
                    <label for="ddlClass">Class</label>
                      <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required."
                          ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                  </div>

                  </div>

                   <div class="col-md-6">
                    <label for="ddlSubject">Subject</label>
                      <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="subject is Required."
                          ControlToValidate="ddlSubject" Display="Dynamic" ForeColor="Red" InitialValue="Select subject" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                  </div>


                  <div class="col-md-6">
                        <label for="txtExpenseAmt">Charge Amount(per Lecture)</label>
                        <asp:TextBox ID="txtExpenseAmt" runat="server" CssClass="form-control" placeholder="Enter Charge Amount"
                            TextMode="Number" Required>

                        </asp:TextBox>
                    </div>





            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
              
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#333300" ForeColor="#ffffff" Text="Add Expense" OnClick="btnAdd_Click" />
                        
                </div>


             </div>

        
            </div>


            <div class="row mb-3 mr-lg-3 ml-lg-5">
                <div class="col-md-6">
                    <asp:GridView ID="gvExpense" runat="server" CssClass= "table table-hover table-bordered" EmptyDataText = "No record to display!" 
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="gvExpense_PageIndexChanging" DataKeyNames="Id"
                        OnRowCancelingEdit="gvExpense_RowCancelingEdit"
                        OnRowEditing="gvExpense_RowEditing" OnRowUpdating="gvExpense_RowUpdating" OnRowDataBound="gvExpense_RowDataBound" OnRowDeleting="gvExpense_RowDeleting">
                       
                        <Columns>


                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                          
                             <asp:BoundField HeaderText="Class">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Subject">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Operation">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Charge Rs.(Per Lecture)">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                              <HeaderStyle BackColor="Black" BorderColor="White" />
                    </asp:GridView>

                </div>
            </div>

        </div>
</asp:Content>
