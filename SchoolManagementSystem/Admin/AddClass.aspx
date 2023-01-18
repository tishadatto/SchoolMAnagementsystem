<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolManagementSystem.Admin.AddClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Image/adc.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <h3 class="text-center text-dark">New Class</h3>

              <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtClass">Class Name</label>
                    <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter Class Name"></asp:TextBox>
                </div>
                  <div class="col-md-3 mt-md-4">
                     <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#333300" ForeColor="#ffffff" Text="Add Class" OnClick="btnAdd_Click" />
                </div>
             </div>

        
            </div>


            <div class="row mb-3 mr-lg-3 ml-lg-5">
                <div class="col-md-6">
                    <asp:GridView ID="gvClass" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="ClassID" AutoGenerateColumns="False"
                        EmptyDataText="No Record to display!" OnPageIndexChanging="gvClass_PageIndexChanging" OnRowCancelingEdit="gvClass_RowCancelingEdit"
                        OnRowEditing="gvClass_RowEditing"
                       >

                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="true"/>
                            
                            <asp:TemplateField HeaderText="Class" HeaderStyle-CssClass="text-center">
                                <EditItemTemplate>
                                   <asp:TextBox ID="txtClassEdit" runat="server" Text='<%# Eval("ClassName")%>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LblClassName"  runat="server" Text='<%# Eval("ClassName")%>' ></asp:Label>
                                </ItemTemplate>

                                     <HeaderStyle CssClass="text-center"></HeaderStyle>

                                <ItemStyle HorizontalAlign="Center" />

                            </asp:TemplateField>
                            <asp:CommandField CausesValidation ="false" HeaderText="Operation" ShowEditButton="True" />

                        </Columns>
                        <HeaderStyle BackColor="Black" BorderColor="White" />
                     
                    </asp:GridView>

                </div>
            </div>

        </div>

</asp:Content>
