using System;
using System.Web.UI;

namespace WebApplication5
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(Session["role"] as string))
                {
                    // User not logged in
                    LinkButton1.Visible = true;  // user login link button
                    LinkButton2.Visible = true;  // sign up link button

                    LinkButton3.Visible = false; // logout link button
                    LinkButton7.Visible = false; // Hello User link button
                    LinkButton6.Visible = true;  // admin login link button

                    // Admin-specific buttons
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                }
                else if (Session["role"].ToString() == "user")
                {
                    // Logged in as user
                    LinkButton1.Visible = false; // user login link button
                    LinkButton2.Visible = false; // sign up link button

                    LinkButton3.Visible = true;  // logout link button
                    LinkButton7.Visible = true; // Hello User link button
                    LinkButton7.Text = "Hello " + Session["username"].ToString();

                    // Admin-specific buttons
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                    LinkButton6.Visible = true;  // admin login
                }
                else if (Session["role"].ToString() == "admin")
                {
                    // Logged in as admin
                    LinkButton1.Visible = false; // user login link button
                    LinkButton2.Visible = false; // sign up link button

                    LinkButton3.Visible = true;  // logout link button
                    LinkButton7.Visible = true; // Hello Admin link button
                    LinkButton7.Text = "Hello Admin";

                    // Admin-specific buttons
                    LinkButton11.Visible = true;
                    LinkButton12.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;
                    LinkButton6.Visible = false; // admin login button
                }
            }
            catch (Exception ex)
            {
                // Log the exception (you can use a logging framework or debug log)
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButtons_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }
        //logout
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] ="";


            LinkButton1.Visible = true;  // user login link button
            LinkButton2.Visible = true;  // sign up link button

            LinkButton3.Visible = false; // logout link button
            LinkButton7.Visible = false; // Hello User link button
            LinkButton6.Visible = true;  // admin login link button

            // Admin-specific buttons
            LinkButton11.Visible = false;
            LinkButton12.Visible = false;
            LinkButton8.Visible = false;
            LinkButton9.Visible = false;
            LinkButton10.Visible = false;

            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Viewbooks.aspx");
        }
    }
    }

