<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="WebApplication5.adminmembermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        // $(".table1").DataTable();
    });
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <!-- Member Details Section -->
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col">
                                <h4>Member Details</h4>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col">
                                <img width="100px" src="imgs/generaluser.png" />
                            </div>
                        </div>
                        <hr />

                        <!-- Member and Book Details -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Member ID"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">
                                        <i class="fas fa-check-circle"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtfullmembername" runat="server" CssClass="form-control" placeholder="Fullname" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mr-1" placeholder="Account Status" ReadOnly="true"></asp:TextBox>
                                    <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                                        <i class="fas fa-check-circle"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">
                                        <i class="far fa-pause-circle"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">
                                        <i class="fas fa-times-circle"></i>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>

                        <!-- Personal Details -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>DOB</label>
                                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" ReadOnly="true" placeholder="DOB"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>Contact No</label>
                                <asp:TextBox ID="txtcontactno" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Contact no"></asp:TextBox>
                            </div>
                            <div class="col-md-5">
                                <label>Email ID</label>
                                <asp:TextBox ID="txtemailid" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Email ID"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <asp:TextBox ID="txtstate" runat="server" CssClass="form-control" ReadOnly="true" placeholder="State"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" ReadOnly="true" placeholder="City"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label>Pin Code</label>
                                <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Pin Code"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Full Postal Address</label>
                                <asp:TextBox ID="fullpostaladdress" runat="server" CssClass="form-control" placeholder="Full Postal Address" ReadOnly="true" TextMode="MultiLine" Rows="2"></asp:TextBox>
                            </div>
                        </div>

                        <!-- Delete Button -->
                        <div class="row">
                            <div class="col-8 mx-auto mt-3">
                                <asp:Button ID="btnadd" runat="server" Text="Delete User Permanently" CssClass="btn btn-lg btn-block btn-danger" OnClick="btnadd_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Members List Section -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col">
                                <h4>Members List</h4>
                            </div>
                        </div>
                        <hr />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1"> 
                            <Columns> 
                                <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" /> 
                                <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" /> 
                                <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" /> 
                                <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" /> 
                                <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" /> 
                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" /> 
                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" /> 
                            </Columns> 
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Back to Home Link -->
        <div class="row">
            <div class="col">
                <a href="homepage.aspx"><< Back To Home</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
