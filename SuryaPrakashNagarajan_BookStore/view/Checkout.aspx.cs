using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery.validate.unobtrusive.min.js",
                DebugPath = "~/Scripts/jquery.validate.unobtrusive.min.js"
            });

            if (!IsPostBack)
            {
                PopulateStateList();
            }

        }

        protected void PopulateStateList()
        {
            State.Items.Add(new ListItem("--select--", ""));
            State.Items.Add(new ListItem("Alberta", "Alberta"));
            State.Items.Add(new ListItem("British Columbia", "British_Columbia"));
            State.Items.Add(new ListItem("Manitoba", "Manitoba"));
            State.Items.Add(new ListItem("New Brunswick", "New_Brunswick"));
            State.Items.Add(new ListItem("Newfoundland and Labrador", "Newfoundland_and_Labrador"));
            State.Items.Add(new ListItem("Nova Scotia", "Nova_Scotia"));
            State.Items.Add(new ListItem("Ontario", "Ontario"));
            State.Items.Add(new ListItem("Prince Edward Island", "Prince_Edward_Island"));
            State.Items.Add(new ListItem("Quebec", "Quebec"));
            State.Items.Add(new ListItem("Saskatchewan", "Saskatchewan"));
            State.Items.Add(new ListItem("Northwest Territories", "Northwest_Territories"));
            State.Items.Add(new ListItem("Nunavut", "Nunavut"));
            State.Items.Add(new ListItem("Yukon", "Yukon"));
        }

        protected void CheckOut_Click(object sender, EventArgs e)
        {
            Page.Validate("form1");
            if (Page.IsValid)
            {
                Response.Redirect("/view/Success.aspx");
            }
        }

        protected void CancelOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("/view/Cart.aspx");
        }
    }
}