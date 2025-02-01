<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="WebApplication5.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <script type="text/javascript"> 
        $(document).ready(function () {
            var table = new DataTable('#<%=GridView1.ClientID%>', {
          pageLength: 10,
          dom: 'Bfrtip',
          ordering: true
      });
  });


        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4> Book Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books.png" id="imgview" src="book_inventory/books1.png" />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:FileUpload ID="FileUpload1" runat="server"  OnChange="FileUpload1_OnChange"  class="form-control" />

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Book ID </label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Book ID"></asp:TextBox>
                                        
                                        <asp:Button runat="server" ID="gobtn" Text="GO" class="btn btn-primary form-control" OnClick="gobtn_Click"></asp:Button>


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                        <asp:ListItem Text="Select Language" Value="select"></asp:ListItem>
                                        <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                        <asp:ListItem Text="Urdu" Value="Urdu"></asp:ListItem>
                                        <asp:ListItem Text="German " Value="German "></asp:ListItem>
                                        <asp:ListItem Text="Marathi" Value="Marathi"></asp:ListItem>
                                        <asp:ListItem Text="French" Value="French"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                        <asp:ListItem Text="Select Publisher" Value="select"></asp:ListItem>
                                        <asp:ListItem Text="Publisher1" Value="Publisher1"></asp:ListItem>
                                        <asp:ListItem Text="Publisher2" Value="Publisher2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList3" runat="server" class="form-control">
                                        <asp:ListItem Text="Select Author" Value="select"></asp:ListItem>
                                        <asp:ListItem Text="A1" Value="A1"></asp:ListItem>
                                        <asp:ListItem Text="a2" Value="a2"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                    <asp:ListBox ID="ListBox1" runat="server" Rows="5" SelectionMode="Multiple" CssClass="form-control">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label> Edition</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Edition" CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label> Book Cost (per Unit)</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Book Cost (per Unit)" CssClass="form-control" TextMode="Number">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pages</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="Pages" TextMode="Number">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label> Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox7" runat="server" placeholder="Actual Stock" CssClass="form-control">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label> Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox8" runat="server" placeholder="Current Stock" CssClass="form-control" TextMode="Number" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="Issued Books" TextMode="Number" ReadOnly="True">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label> Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox10" runat="server" placeholder="Book Description" CssClass="form-control" TextMode="MultiLine" Rows="2">  </asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-lg btn-block btn-success" OnClick="Button1_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button2" runat="server" Text="Update" class="btn btn-lg btn-block btn-warning" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" runat="server" Text="Delete" class="btn btn-lg btn-block btn-danger" OnClick="Button3_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"> << Back To Home</a><br><br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <h4> Book Inventory List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"> 
                                <hr />
                       <div class="row"> 

<div class="col"> 

  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
<asp:GridView class="table" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="book_id" 
    AutoGenerateColumns="False" BorderStyle="None" GridLines="None" >
<Columns> 
    <asp:BoundField DataField="book_id" HeaderText="ID" ItemStyle-Width="50px" />
    <asp:TemplateField> 
        <ItemTemplate> 
            <div class="container-fluid p-3" style="background-color: #f8f9fa;"> 
                <div class="row"> 
                    <div class="col-lg-10"> 
                        <div class="row"> 
                            <div class="col-12"> 
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' 
                                    Font-Bold="True" Font-Size="Large" style="color: #333;"></asp:Label> 
                            </div>
                        </div> 
                        <div class="row mt-2"> 
                            <div class="col-12"> 
                                Author - <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("author_name") %>'></asp:Label> 
                                | Genre - <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("genre") %>'></asp:Label> 
                                | Language - <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("language") %>'></asp:Label> 
                            </div>
                        </div>
                        <div class="row mt-2"> 
                            <div class="col-12"> 
                                Publisher - <asp:Label ID="Labelpublisher" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("publisher_name") %>'></asp:Label> 
                                | Publish Date - <asp:Label ID="LabelPublishDate" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("publish_date") %>'></asp:Label> 
                                | Pages - <asp:Label ID="LabelPages" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("no_of_pages") %>'></asp:Label> 
                                | Edition - <asp:Label ID="LabelEdition" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("editition") %>'></asp:Label> 
                            </div>
                        </div> 
                        <div class="row mt-2"> 
                            <div class="col-12"> 
                                Cost - <asp:Label ID="LabelCost" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("book_cost") %>'></asp:Label> 
                                | Actual Stock - <asp:Label ID="LabelActualStock" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("actual_cost") %>'></asp:Label> 
                                | Available - <asp:Label ID="LabelAvailableStock" runat="server" Font-Bold="True" 
                                    Text='<%# Eval("current_cost") %>'></asp:Label> 
                            </div>
                        </div> 
                        <div class="row mt-2"> 
                            <div class="col-12"> 
                                Description - <asp:Label ID="LabelDescription" runat="server" Font-Italic="True" 
                                    Text='<%# Eval("book_description") %>'></asp:Label> 
                            </div>
                        </div> 
                    </div> 
                    <div class="col-lg-2"> 
                        <asp:Image class="img-fluid" ID="Image1" runat="server" 
                            ImageUrl='<%# Eval("book_img_link") %>' style="max-height: 150px;" /> 
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- DataTables Library -->
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
</asp:Content>