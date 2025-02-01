<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="WebApplication5.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
     $(document).ready(function () {
         $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
         // $(".table1").DataTable();
     });
 </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <!-- Author Details Section -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author Details</h4>
                                </center>
                            </div>
                            </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <img class="img-fluid" style="width: 100px;" src="imgs/writer.png" />
                                </center>
                            </div>
                        </div>

                        <!-- Separator -->
                        <div class="row">
                            <div class="col">
                                <center><hr /></center>
                            </div>
                        </div>

                        <!-- User Details -->
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Author ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtauthorid" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>
                                        <div class="input-group-append">
                                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Go" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label>Author Name</label>
                                    <asp:TextBox ID="txtauthorname" runat="server" CssClass="form-control" placeholder="Author Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnadd" CssClass="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnadd_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnupdate" CssClass="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnupdate_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btndelete" CssClass="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btndelete_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back To Home</a><br /><br />
            </div>

            <!-- Author List Section -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Author List</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="author_id">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id"></asp:BoundField>
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>