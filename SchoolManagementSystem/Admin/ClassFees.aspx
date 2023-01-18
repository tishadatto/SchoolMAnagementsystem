<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="SchoolManagementSystem.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div style="background-image: url('../Image/adc.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center text-dark">New Fees</h3>

              <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">

                  <div class="col-md-6">
                    <label for="ddlClass">Class</label>
                      <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required."
                          ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">

                      </asp:RequiredFieldValidator>
                  </div>

                <div class="col-md-6">
                    <label for="txtFeeAmounts">Fees(Annual)</label>
                    <asp:TextBox ID="txtFeeAmounts" runat="server" CssClass="form-control" placeholder="Enter Fees Amount" Required>

                    </asp:TextBox>
                </div>

                  <div class="col-md-3 mt-md-4">
                     <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#333300" ForeColor="#ffffff" Text="Add Fees" OnClick="btnAdd_Click" />
                </div>
             </div>

        
            </div>


            <div class="row mb-3 mr-lg-3 ml-lg-5">
                <div class="col-md-6">
                    <asp:GridView ID="gvClassFees" runat="server" CssClass= "table table-hover table-bordered" EmptyDataText = "No record to display!" 
                        AutoGenerateColumns="False" AllowPaging="true" PageSize="4" OnPageIndexChanging="gvClassFees_PageIndexChanging" DataKeyNames="FeesId"
                        OnRowCancelingEdit="gvClassFees_RowCancelingEdit"
                        OnRowDeleting="gvClassFees_RowDeleting" OnRowEditing="gvClassFees_RowEditing" OnRowUpdating="gvClassFees_RowUpdating">
                       
                        <Columns>


                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ClassName" HeaderText="Class">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Fees(Annual)">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("FeesAmount") %>' CssClass="form-check"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                              <HeaderStyle BackColor="Black" BorderColor="White" />
                    </asp:GridView>

                </div>
            </div>

        </div>
</asp:Content>
