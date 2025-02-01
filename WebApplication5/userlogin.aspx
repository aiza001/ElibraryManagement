<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="WebApplication5.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <img width="150px" src="imgs/generaluser.png" alt="User Icon"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Member ID</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Member ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1"
                                        ErrorMessage="Member ID is required" 
                                        ForeColor="Red" 
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>Member Password</label>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2"
                                        ErrorMessage="Password is required" 
                                        ForeColor="Red" 
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" 
                                        Text="Login" 
                                        OnClick="Button1_Click" />
                                </div>
                                <div class="form-group">
                                    <a href="usersignup.aspx">
                                        <input id="Button2" class="btn btn-info btn-block btn-lg" type="button" value="Sign Up" />
                                    </a>
                                </div>
                                <!-- Validation Summary to show all errors -->
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                    ForeColor="Red" 
                                    DisplayMode="List" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx">&lt;&lt; Back To Home</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>