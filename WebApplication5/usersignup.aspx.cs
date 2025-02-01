using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication5
{
    public partial class usersignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('Member already exists with this Member ID. Try another ID.');</script>");
            }
            else
            {
                signUpNewMember();
            }
        }

        bool checkMemberExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id", con);
                    cmd.Parameters.AddWithValue("@member_id", TextBox8.Text.Trim());
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt.Rows.Count >= 1;
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                return false;
            }
        }

        void signUpNewMember()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl(full_name, dob, contact_no, email, state, city, pincode, full_address, member_id, password, account_status) VALUES (@full_name, @dob, @contact_no, @email, @state, @city, @pincode, @full_address, @member_id, @password, @account_status)", con);

                    cmd.Parameters.AddWithValue("@full_name", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(TextBox6.Text.Trim()));
                    cmd.Parameters.AddWithValue("@contact_no", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@full_address", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@member_id", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@account_status", "pending");

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Signup Successful! Go to User Login to Login.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}