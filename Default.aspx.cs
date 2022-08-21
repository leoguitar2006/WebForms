using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebForms
{
    public partial class _Default : Page
    {
        public void UpdateGrid() {
            if (Page.IsPostBack) {
                GridView1.DataBind();
            }
        }

        public void ClearPage() {
            txtNome.Text = "";
            txtDataNasc.Text = "";
            txtSalario.Text = "0";

        }
        protected void ExecutarComando() {
            SqlConnection conn;
            SqlCommand cmd;

            string Insercao = "Insert Into CLIENTES(NOME, DATANASC, SALARIO ) Values (@Nome, @DataNasc, @Salario)";

            //using para liberar a conn e cmd da memória posteriormente...(achei pesquisando esse uso, não sei se está correto
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CRUDConnectionString1"].ConnectionString)) {
                conn.Open();
                                
                cmd = new SqlCommand(Insercao, conn);
                cmd.Parameters.AddWithValue("@Nome", txtNome.Text);
                cmd.Parameters.AddWithValue("@DataNasc", txtDataNasc.Text);
                cmd.Parameters.AddWithValue("@Salario", txtSalario.Text);
                cmd.ExecuteNonQuery();
                
                conn.Close();
            }
            UpdateGrid();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                ClearPage();
            }
            txtNome.Focus();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ExecutarComando();
        }

        protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
        {
            txtNome.Text = GridView1.SelectedRow.Cells[2].Text;
            if (GridView1.SelectedRow.Cells[3].Text != "")
            {
                txtDataNasc.Text = Convert.ToDateTime(GridView1.SelectedRow.Cells[3].Text).ToString("yyyy-MM-dd");
            }

            txtSalario.Text = GridView1.SelectedRow.Cells[4].Text;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            ClearPage();
        }
    }
}