<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Viewbooks.aspx.cs" Inherits="WebApplication5.Viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            setTimeout(function () {
                var grid = $('#<%=GridView1.ClientID%>').DataTable({
                    pageLength: 4, // Only 4 items per page
                    dom: 'Bfrtip',
                    ordering: true,
                    drawCallback: function (settings) {
                        // Move to the last page when a new record is added
                        var api = this.api();
                        var lastPage = api.page.info().pages - 1;
                        api.page(lastPage).draw(false);
                    }
                });
            }, 500);
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <h3>Book Inventory List</h3>
                </center>
                <div class="row">
                    <div class="col-12">
                        <asp:Panel CssClass="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" 
                                        SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>

                                    <asp:GridView CssClass="table table-striped table-bordered" ID="GridView1"
                                        runat="server" DataSourceID="SqlDataSource1" DataKeyNames="book_id"
                                        AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="book_id" HeaderText="ID" ItemStyle-Width="50px" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid p-3" style="background-color: #f8f9fa;">
                                                        <div class="row">
                                                            <div class="col-lg-10">
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="LabelBookName" runat="server"
                                                                            Text='<%# Eval("book_name") %>'
                                                                            Font-Bold="True" Font-Size="Large"
                                                                            style="color: #333;"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-12">
                                                                        Author - <asp:Label ID="LabelAuthor" runat="server"
                                                                            Font-Bold="True"
                                                                            Text='<%# Eval("author_name") %>'></asp:Label>
                                                                        | Genre - <asp:Label ID="LabelGenre" runat="server"
                                                                            Font-Bold="True"
                                                                            Text='<%# Eval("genre") %>'></asp:Label>
                                                                        | Language - <asp:Label ID="LabelLanguage" runat="server"
                                                                            Font-Bold="True"
                                                                            Text='<%# Eval("language") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-12">
                                                                        Publisher - <asp:Label ID="LabelPublisher"
                                                                            runat="server" Font-Bold="True"
                                                                            Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                        | Publish Date - <asp:Label ID="LabelPublishDate"
                                                                            runat="server" Font-Bold="True"
                                                                            Text='<%# Eval("publish_date", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                                        | Pages - <asp:Label ID="LabelPages" runat="server"
                                                                            Font-Bold="True"
                                                                            Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                        | Edition - <asp:Label ID="LabelEdition"
                                                                            runat="server" Font-Bold="True"
                                                                            Text='<%# Eval("editition") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-12">
                                                                        Cost - <asp:Label ID="LabelCost" runat="server"
                                                                            Font-Bold="True"
                                                                            Text='<%# Eval("book_cost", "{0:C}") %>'></asp:Label>
                                                                        | Actual Stock - <asp:Label ID="LabelActualStock"
                                                                            runat="server" Font-Bold="True"
                                                                            Text='<%# Eval("actual_cost") %>'></asp:Label>
                                                                        | Available - <asp:Label ID="LabelAvailableStock"
                                                                            runat="server" Font-Bold="True"
                                                                            Text='<%# Eval("current_cost") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-2">
                                                                    <div class="col-12">
                                                                        Description - <asp:Label ID="LabelDescription"
                                                                            runat="server" Font-Italic="True"
                                                                            Text='<%# Eval("book_description") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <asp:Image CssClass="img-fluid" ID="Image1" runat="server"
                                                                    ImageUrl='<%# string.IsNullOrEmpty(Eval("book_img_link").ToString()) ? "default.jpg" : Eval("book_img_link") %>'
                                                                    style="max-height: 150px;" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <center>
        <a href="home.aspx"><< Back to Home</a>
        <span class="clearfix"></span><br />
    </center>
</asp:Content>
