<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="WebApplication5.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class=" card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center> 
                                    <img width="100px" src="imgs/generaluser.png"/>
                                </center>
                            </div>
                        </div>
                       <div class="row">
                            <div class="col">
                                <center> 
<h4>Your Profile </h4>  
                                    <span>
                                        Account Status --</span>
                                    <asp:Label ID="Label1" runat="server" Text="Your Status" class="badge badge-pill badge-info"  ></asp:Label>

                                </center>
                            </div>
                        </div>
                                              
                        
                        <div class="row">
                            <div class="col">
                                <center> 
<hr />                              </center>
                            </div>
                        </div>
                        <div class="row">
<div class="col-md-6">
    <div class="form-group">
      <label>Full Name</label>
        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>   

    </div></div>                           
                                                                                             
<div class="col-md-6">
    <div class="form-group">
      <label>Date of Birth</label>
        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                           
                               
                            </div>
                        </div>
                                               
                                </div> 
                
 <div class="row">
<div class="col-md-6">
    <div class="form-group">
      <label>Contact No</label>
        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Contact No."></asp:TextBox>   

    </div></div>                           
                                                                                             
<div class="col-md-6">
    <div class="form-group">
      <label>Email ID</label>
        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="Email" placeholder="Email ID">

        </asp:TextBox>
                           
                               
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

       
    </div></div>                           
                                                                                             
<div class="col-md-4">
    <div class="form-group">
      <label>City</label>
        <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="City">

        </asp:TextBox>
                           
                               
                            </div>
                        </div>

     <div class="col-md-4">
    <div class="form-group">
      <label>Pin Code</label>
        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Number" placeholder="Pin Code">

        </asp:TextBox>
                           
                               
                            </div>
                        </div>

     </div>   
                        <div class="row">
<div class="col">
    <div class="form-group">
      <label> Address</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Address" TextMode="MultiLine" Rows="2"></asp:TextBox>   

  
                               
                            </div>
                        </div>
                                               
                                </div> 
                        <div class="row">

                   <div class="col">
                       <center>
               <span class="badge badge-pill badge-info"> Login Credentials</span>
                     </center>         
                   </div>
                           
                        </div>
                       

                        <div class="row">
<div class="col-md-4">
    <div class="form-group">
      <label> User ID</label>
        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" placeholder="User ID" ReadOnly="true"></asp:TextBox>   

  
 
                        

                            </div>
                        </div>
                            <div class="col-md-4">
    <div class="form-group">
      <label> Old Password </label>
        <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" ReadOnly="true" ></asp:TextBox>   

                            </div>
                        </div>
                                                    <div class="col-md-4">
<div class="form-group">
  <label>New Password </label>
    <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>   

                        </div>
                    </div>

                                               
                                </div> 

                   
                        <div class="row">

                      <div class="col-9 mx-auto">
                          <center>
                <div class="form-group">
                    <asp:Button ID="Button1" class="btn btn-primary btn-block btn-lg" runat="server" Text= "Update" />    
                                
                    </div>
                              </center>
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
                                    <img width="100px" src="imgs/books1.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4> Your Issued Books</h4>
                                    <asp:Label ID="Label2" runat="server" Text="Your books info" class="badge badge-pill badge-info"></asp:Label>
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
          <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" ></asp:GridView>

          
      </div>
  </div>
                        









                    </div>

                </div>

            </div>
        </div>
  </div>
        
</asp:Content>    
