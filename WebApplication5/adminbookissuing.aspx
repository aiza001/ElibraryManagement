<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="WebApplication5.adminbookissuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <!-- Left Column -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <h4>Book Issuing</h4>
                            <img width="100px" src="imgs/books.png" />
                        </div>
                        <hr />

                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Member ID"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                                    <asp:Button ID="Button1" runat="server" Text="Go" class="btn btn-primary" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                <asp:TextBox ID="TextBox3" ReadOnly="true" runat="server" CssClass="form-control" placeholder="Member Name"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                <asp:TextBox ID="TextBox4" ReadOnly="true" runat="server" CssClass="form-control" placeholder="Book Name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Date</label>
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label>End Date</label>
                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-6">
                                <asp:Button ID="btnadd" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="btnadd_Click" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="btnupdate" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="btnupdate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body text-center">
                        <h4>Issued Books</h4>
                    </div>
                    <hr />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                        <Columns>
                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <a href="homepage.aspx">&lt;&lt; Back To Home</a>
    </div>
</asp:Content>
