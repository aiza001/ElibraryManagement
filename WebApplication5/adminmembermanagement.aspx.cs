using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace WebApplication5
{
    public partial class adminmembermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        // Go button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getMemberById();
        }

        // Danger button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            updateMemberStatusById("deactive");
        }

        // Check active button
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            updateMemberStatusById("active");
        }

        // Pause button
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            updateMemberStatusById("pending");
        }

        // Delete User Permanently
        protected void btnadd_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        void getMemberById()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    if (con.State == System.Data.ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id=@memberID", con);
                    cmd.Parameters.AddWithValue("@memberID", TextBox2.Text.Trim());

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            txtfullmembername.Text = dr.GetValue(0).ToString();
                            TextBox1.Text = dr.GetValue(10).ToString();
                            TextBox7.Text = dr.GetValue(1).ToString();
                            txtcontactno.Text = dr.GetValue(2).ToString();
                            txtemailid.Text = dr.GetValue(3).ToString();
                            txtstate.Text = dr.GetValue(4).ToString();
                            txtcity.Text = dr.GetValue(5).ToString();
                            txtpincode.Text = dr.GetValue(6).ToString();
                            fullpostaladdress.Text = dr.GetValue(7).ToString();
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid credentials');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        void updateMemberStatusById(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        if (con.State == System.Data.ConnectionState.Closed)
                        {
                            con.Open();
                        }

                        // Use parameterized query to prevent SQL injection
                        SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status=@status WHERE member_id=@memberID", con);
                        cmd.Parameters.AddWithValue("@status", status); // Bind status as parameter
                        cmd.Parameters.AddWithValue("@memberID", TextBox2.Text.Trim()); // Bind member_id as parameter
                        cmd.ExecuteNonQuery();
                        con.Close();
                        GridView1.DataBind();
                        Response.Write("<script>alert('Member Status Updated Successfully');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid MemberID'); </script>");
            }
        }
        void deleteMemberByID()

            {
                
                if (checkIfMemberExists())
                {
                    try
                    {
                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id = @member_id", con);
                            cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
                            cmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Member Deleted Successfully');</script>");
                            clearForm();
                            GridView1.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                    }
                }
                else
                {
                Response.Write("<script>alert('Invalid MemberID'); </script>");
                }
            }
                void clearForm()
                {
                    TextBox2.Text = "";
                    txtfullmembername.Text = "";
                     TextBox1.Text = "";
                    TextBox7.Text = "";
                    txtcontactno.Text = "";
                    txtemailid.Text = "";
                    txtstate.Text = "";
                    txtcity.Text = "";
                    txtpincode.Text = "";
                    fullpostaladdress.Text = "";
                }
            bool checkIfMemberExists()
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT * FROM member_master_tbl WHERE member_id = @member_id", con);
                        cmd.Parameters.AddWithValue("@member_id", TextBox2.Text.Trim());
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
        

        
    }
}
