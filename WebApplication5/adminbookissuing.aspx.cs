using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication5
{
    public partial class adminbookissuing : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Issue
        protected void btnadd_Click(object sender, EventArgs e)
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already Has this Book');</script>");
                }
                else
                {
                    issueBook();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }

        // Return
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (checkIfBookExist() && checkIfMemberExist())
            {
                if (checkIfIssueEntryExist())
                {
                    returnBook();
                }
                else
                {
                    Response.Write("<script>alert('This Entry does not Exist');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong Book ID or Member ID');</script>");
            }
        }

        // Go
        protected void Button1_Click(object sender, EventArgs e)
        {
            getNames();
        }

        void getNames()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    // Using INNER JOIN to get book details
                    SqlCommand cmd = new SqlCommand("SELECT bm.book_name FROM book_master_tbl bm INNER JOIN book_issue_tbl bi ON bm.book_id = bi.book_id WHERE bi.book_id = @book_id", con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        TextBox4.Text = dt.Rows[0]["book_name"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Book ID');</script>");
                    }

                    // Using INNER JOIN to get member details
                    cmd = new SqlCommand("SELECT mm.full_name FROM member_master_tbl mm INNER JOIN book_issue_tbl bi ON mm.member_id = bi.member_id WHERE bi.member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());
                    da = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        TextBox3.Text = dt.Rows[0]["full_name"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Member ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        bool checkIfBookExist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    // Using INNER JOIN to check if the book exists
                    SqlCommand cmd = new SqlCommand("SELECT * FROM book_master_tbl bm INNER JOIN book_issue_tbl bi ON bm.book_id = bi.book_id WHERE bm.book_id = @book_id AND bm.current_cost > 0", con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count > 0;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        bool checkIfMemberExist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    // Using INNER JOIN to check if the member exists
                    SqlCommand cmd = new SqlCommand("SELECT mm.full_name FROM member_master_tbl mm INNER JOIN book_issue_tbl bi ON mm.member_id = bi.member_id WHERE mm.member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count > 0;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        bool checkIfIssueEntryExist()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    // Using INNER JOIN to check if the issue entry exists
                    SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_tbl bi INNER JOIN book_master_tbl bm ON bi.book_id = bm.book_id WHERE bi.member_id = @member_id AND bi.book_id = @book_id", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt.Rows.Count > 0;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        void issueBook()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl(member_id, member_name, book_id, book_name, issue_date, due_date) VALUES (@member_id, @member_name, @book_id, @book_name, @issue_date, @due_date)", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_name", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@book_name", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@issue_date", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@due_date", TextBox6.Text.Trim());
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand("UPDATE book_master_tbl SET current_cost = current_cost - 1 WHERE book_id = @book_id", con);
                    cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Book Issued Successfully');</script>");
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        void returnBook()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    // Step 1: Delete the issued book record
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_tbl WHERE book_id = @book_id AND member_id = @member_id", con))
                    {
                        cmd.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                        cmd.Parameters.AddWithValue("@member_id", TextBox1.Text.Trim());

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            // Step 2: Update the book stock
                            using (SqlCommand cmdUpdate = new SqlCommand("UPDATE book_master_tbl SET current_cost = current_cost + 1 WHERE book_id = @book_id", con))
                            {
                                cmdUpdate.Parameters.AddWithValue("@book_id", TextBox2.Text.Trim());
                                cmdUpdate.ExecuteNonQuery();
                                con.Close();
                            }

                            // Success message
                            Response.Write("<script>alert('Book Returned Successfully');</script>");
                            GridView1.DataBind();
                            con.Close();
                        }
                        else
                        {
                            Response.Write("<script>alert('Error: No matching record found.');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataRound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
