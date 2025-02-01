<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="WebApplication5.adminpublishermanagement" %>

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
            <!-- Publisher Details Section -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <!-- Section Title -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher Details</h4>
                                </center>
                            </div>
                        </div>

                        <!-- Publisher Image -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="imgs/publisher.png" class="img-fluid" alt="Publisher Image" />
                                </center>
                            </div>
                        </div>

                        <!-- Separator -->
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <!-- Publisher Details Form -->
                        <div class="row">
                            <!-- Publisher ID -->
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Publisher ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtpublisherid" runat="server" CssClass="form-control" placeholder="ID"></asp:TextBox>
                                        <div class="input-group-append">
                                            <asp:Button ID="btnGo" runat="server" CssClass="btn btn-primary" Text="Go" OnClick="btnGo_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Publisher Name -->
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Publisher Name</label>
                                    <asp:TextBox ID="txtpublishername" runat="server" CssClass="form-control" placeholder="Publisher Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-lg btn-block btn-success" Text="Add" OnClick="btnAdd_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-lg btn-block btn-warning" Text="Update" OnClick="btnUpdate_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-lg btn-block btn-danger" Text="Delete" OnClick="btnDelete_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back To Home</a>
            </div>

            <!-- Publisher List Section -->
            <div class="col-md-7">
               
                <div class="card">
                    <div class="card-body">
                        <!-- Section Title -->
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher List</h4>
                                </center>
                            </div>
                        </div>

                        <!-- Separator -->
                        <div class="row">
                            <div class="col"><hr />
                            </div>
                        </div>
                        
                        <!-- Publisher List Table -->
                        <div class="row">
                                <div class="col">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                                    <asp:GridView  class="table table-striped table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="publisher_id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"></asp:GridView>
                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>