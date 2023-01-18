<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SchoolManagementSystem.Admin.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<<%--style type="text/css">
        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%;
            margin-bottom: 1;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style2 {
            display: block;
            width: 100%;
            height: calc(1.5em + .75rem + 2px);
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            margin-left: 0;
            background-color: #fff;
        }
    </style>--%>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url(''); background-repeat: no-repeat; background-size: cover; background-attachment: fixed;" class="auto-style1">
        <div class="container p-md-4 p-sm-4">

            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>

            <h3 class="text-center">Add Student </h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label for="txtName">Name</label>

                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" PlaceHolder="Enter Name "
                        required></asp:TextBox>
                   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should be Characters."
                        ForeColor="red" ValidationExpression="^[a-zA-Z\s]*$ " Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                    </asp:RegularExpressionValidator>--%>
                </div>
                <div>
                    <div class="col-md-6">
                        <label for="txtDoB">Date of Birth</label>
                        <asp:TextBox ID="txtDoB" runat="server" CssClass="auto-style2" TextMode="Date"
                            required></asp:TextBox>

                    </div>

                </div>

                <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-6">
                        <label for="ddlGender">Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is Required."
                            ControlToValidate="ddlGender" Display="Dynamic" ForeColor="Red" InitialValue="Select Gender" SetFocusOnError="True">
                        </asp:RequiredFieldValidator>

                    </div>
                    <div class="auto-style1">
                        <label for="txtMobile">Contact Number</label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" placeholder="10 Digits Mobile No" required></asp:TextBox>
                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile No."
                            ForeColor="red" ValidationExpression="[0-9]{11} " Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                        </asp:RegularExpressionValidator>--%>
                    </div>

                </div>

                <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-6">
                        <label for="txtRoll">Roll Number</label>
                        <asp:TextBox ID="txtRoll" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter Roll" required></asp:TextBox>

                    </div>
                    <div class="col-md-6">
                        <label for="ddlClass">Class</label>
                        <%--<asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"required></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Class is Required."
                            ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True">
                        </asp:RequiredFieldValidator>

                    </div>

                </div>

                <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-12">
                        <label for="txtAddress">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="Multiline" placeholder="Enter Address" required></asp:TextBox>

                    </div>


                </div>

                <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-3 col-md-offset-2 mb-3">
                        <asp:Button ID="btnAdd" runat="server" Width="150px" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Student" OnClick="btnAdd_Click" />
                    </div>

                </div>
                <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                    <div class="col-md-12">
                        <asp:GridView ID="gvStudent" runat="server" CssClass= "table table-hover table-bordered" EmptyDataText = "No record to display!" 
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="gvStudent_PageIndexChanging" DataKeyNames="StudentId"
                        OnRowCancelingEdit="gvStudent_RowCancelingEdit"
                        OnRowEditing="gvStudent_RowEditing" OnRowUpdating="gvStudent_RowUpdating" OnRowDataBound="gvStudent_RowDataBound">
                       
                        <Columns>


                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' CssClass="form-control"
                                        Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="Mobile">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Mobile") %>' CssClass="form-control"
                                         Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                                 

                            <asp:TemplateField HeaderText="Roll Number">
                                 <EditItemTemplate>
                                    <asp:TextBox ID="txtRollNo" runat="server" Text='<%# Eval("RollNO") %>' CssClass="form-control"
                                         Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                 <ItemTemplate>
                                    <asp:Label ID="txtRollNo" runat="server" Text='<%# Eval("RollNO") %>'></asp:Label>
                                </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"/>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"  Width="120px" ></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblClass" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>   



                            <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' CssClass="form-control"
                                         Width="1000px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>   

                            <asp:CommandField HeaderText="Operation" ShowEditButton="True" ShowDeleteButton="true">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                       
                        </Columns>
                              <HeaderStyle BackColor="Black" BorderColor="White" />
                    </asp:GridView>
                    </div>

                </div>


            </div>

        </div>

    </div>
</asp:Content>
