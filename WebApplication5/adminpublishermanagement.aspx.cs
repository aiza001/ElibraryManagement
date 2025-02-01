using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace WebApplication5
{
    public partial class adminpublishermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                Response.Write("<script>alert('Publisher with this ID already exists');</script>");
            }
            else
            {
                addNewPublisher();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                updatePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherExists())
            {
                deletePublisher();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist');</script>");
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getPublisherById();
        }

        bool checkIfPublisherExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_CheckIfPublisherExists", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@publisher_id", txtpublisherid.Text.Trim());

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

        void addNewPublisher()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_AddNewPublisher", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@publisher_id", txtpublisherid.Text.Trim());
                    cmd.Parameters.AddWithValue("@publisher_name", txtpublishername.Text.Trim());
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Publisher Added Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        void updatePublisher()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_UpdatePublisher", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@publisher_id", txtpublisherid.Text.Trim());
                    cmd.Parameters.AddWithValue("@publisher_name", txtpublishername.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Publisher Updated Successfully');</script>");
                        GridView1.DataBind();
                        clearForm();
                    }
                    else
                    {
                        Response.Write("<script>alert('No publisher found with this ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        void deletePublisher()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_DeletePublisher", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@publisher_id", txtpublisherid.Text.Trim());
                    cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        void getPublisherById()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_GetPublisherById", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@publisher_id", txtpublisherid.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count >= 1)
                    {
                        txtpublishername.Text = dt.Rows[0]["publisher_name"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Publisher ID');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        void clearForm()
        {
            txtpublisherid.Text = "";
            txtpublishername.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}
