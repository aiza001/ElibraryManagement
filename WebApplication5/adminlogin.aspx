﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication5.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <img width="150px" src="imgs/adminuser.png"/>
                                </center>
                            </div>
                        </div>
                       <div class="row">
                            <div class="col">
                                <center> 
<h3>Admin Login </h3>                                </center>
                            </div>
                        </div> <div class="row">
                            <div class="col">
                                <center> 
<hr />                              </center>
                            </div>
                        </div>
                                               <div class="row">
                            <div class="col">
                                <div class="form-group">
                                  <label>Admin ID</label>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Admin ID"></asp:TextBox>
                                </div>
                                  <div class="form-group">
    <label>Member Password</label>
      <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Pasword" TextMode="Password"></asp:TextBox>
  </div>
                               <div class="form-group">
                                   <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                               </div>
                               
                            </div>
                        </div>
                    </div>
                                    <a href="homepage.aspx"> << Back To Home</a><br><br />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
