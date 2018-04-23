using System;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            ASPxGridView1.FilterExpression = ASPxFilterControl1.FilterExpression;
    }
}