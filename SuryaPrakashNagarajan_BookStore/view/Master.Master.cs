using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
                {
                    Path = "~/Scripts/jquery-1.8.0.min.js",
                    DebugPath = "~/Scripts/jquery-1.8.0.min.js"
                });

                string firstName = Session["FirstName"] as string;
                string lastName = Session["LastName"] as string;

                string currentPage = System.IO.Path.GetFileName(Request.Path);

                if ((firstName == null || lastName == null) && !currentPage.Equals("Login", StringComparison.OrdinalIgnoreCase))
                {
                     Response.Redirect("/Login");
                }
                else if (firstName != null && lastName != null && currentPage.Equals("Login", StringComparison.OrdinalIgnoreCase))
                {
                    Response.Redirect("/Products");
                }

                if (!currentPage.Equals("Login", StringComparison.OrdinalIgnoreCase))
                {
                    WelcomeText.Text = "Welcome " + firstName + " " + lastName + "!";
                }else
                {
                    NavBarDiv.Visible = false;
                }

            }
        }
    }
}