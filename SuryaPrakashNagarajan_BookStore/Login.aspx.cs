using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuryaPrakashNagarajan_BookStore.view;

namespace SuryaPrakashNagarajan_BookStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void handleSubmit(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string firstName = FirstName.Text.Trim();
                string lastName = LastName.Text.Trim();

                Session["FirstName"] = firstName;
                Session["LastName"] = lastName;

                Response.Redirect("/Products");
            }
        }
    }
}