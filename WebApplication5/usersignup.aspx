<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="WebApplication5.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <img width="100px" src="imgs/generaluser.png" alt="User Icon"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <h4>User Registration</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center><hr /></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="TextBox7"
                                        ErrorMessage="Full Name is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="TextBox6"
                                        ErrorMessage="Date of Birth is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Contact No</label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Contact No."></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="TextBox3"
                                        ErrorMessage="Contact Number is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ControlToValidate="TextBox3"
                                        ErrorMessage="Invalid Phone Number"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ValidationExpression="^\d{10,12}$"
                                        EnableClientScript="true">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email ID</label>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="TextBox5"
                                        ErrorMessage="Email ID is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                        ControlToValidate="TextBox5"
                                        ErrorMessage="Invalid Email Format"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        EnableClientScript="true">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>State</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Select Province/State" Value="select"></asp:ListItem>
                                        <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                        <asp:ListItem Text="Sindh" Value="Sindh"></asp:ListItem>
                                        <asp:ListItem Text="Khyber Pakhtunkhwa" Value="Khyber Pakhtunkhwa"></asp:ListItem>
                                        <asp:ListItem Text="Balochistan" Value="Balochistan"></asp:ListItem>
                                        <asp:ListItem Text="Azad Jammu and Kashmir" Value="Azad Jammu and Kashmir"></asp:ListItem>
                                        <asp:ListItem Text="Gilgit-Baltistan" Value="Gilgit-Baltistan"></asp:ListItem>
                                        <asp:ListItem Text="Islamabad Capital Territory" Value="Islamabad Capital Territory"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        ControlToValidate="DropDownList1"
                                        ErrorMessage="Please select a state"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true"
                                        InitialValue="select">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>City</label>
                                    <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="City"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                        ControlToValidate="TextBox2"
                                        ErrorMessage="City is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Pin Code</label>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Number" placeholder="Pin Code"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                        ControlToValidate="TextBox4"
                                        ErrorMessage="Pin Code is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Address</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        ControlToValidate="TextBox1"
                                        ErrorMessage="Address is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Login ID</label>
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" placeholder="Login ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                        ControlToValidate="TextBox8"
                                        ErrorMessage="Login ID is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                        ControlToValidate="TextBox9"
                                        ErrorMessage="Password is required"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        EnableClientScript="true">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                        ControlToValidate="TextBox9"
                                        ErrorMessage="Password must be 6-20 characters long with at least one number and one special character"
                                        ForeColor="Red"
                                        Display="Dynamic"
                                        ValidationExpression="^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,20}$"
                                        EnableClientScript="true">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Sign Up" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx">&lt;&lt; Back To Home</a><br /><br />
            </div>
        </div>
    </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ForeColor="Red" 
        DisplayMode="List"
        EnableClientScript="true" />
</asp:Content>