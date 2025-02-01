using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication5
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtauthorid.Text) || string.IsNullOrWhiteSpace(txtauthorname.Text))
            {
                Response.Write("<script>alert('Please fill all the fields.');</script>");
                return;
            }

            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID already exists');</script>");
            }
            else
            {
                addNewAuthor();
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                updateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string updateQuery = "UPDATE author_master_tbl SET author_name = @author_name WHERE author_id = @author_id";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);

                    cmd.Parameters.Add("@author_name", SqlDbType.VarChar).Value = txtauthorname.Text.Trim();
                    cmd.Parameters.Add("@author_id", SqlDbType.VarChar).Value = txtauthorid.Text.Trim();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Author Updated Successfully');</script>");
                        GridView1.DataBind();
                        clearForm();
                    }
                    else
                    {
                        Response.Write("<script>alert('No author found with this ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        void addNewAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id, author_name) VALUES (@author_id, @author_name)", con);
                    cmd.Parameters.AddWithValue("@author_id", txtauthorid.Text.Trim());
                    cmd.Parameters.AddWithValue("@author_name", txtauthorname.Text.Trim());
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Author Added Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        void deleteAuthor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id = @author_id", con);
                    cmd.Parameters.AddWithValue("@author_id", txtauthorid.Text.Trim());
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Author Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        bool checkIfAuthorExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id = @author_id", con);
                    cmd.Parameters.AddWithValue("@author_id", txtauthorid.Text.Trim());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt.Rows.Count > 0;
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                return false;
            }
        }

        void clearForm()
        {
            txtauthorid.Text = "";
            txtauthorname.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getAuthorById();
        }
        void getAuthorById()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM author_master_tbl WHERE author_id = @author_id", con);
                    cmd.Parameters.AddWithValue("@author_id", txtauthorid.Text.Trim());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count >= 1)
                    {
                        txtauthorname.Text = dt.Rows[0][1].ToString();


                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Author ID'); </script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");

            }

        }
    }
}