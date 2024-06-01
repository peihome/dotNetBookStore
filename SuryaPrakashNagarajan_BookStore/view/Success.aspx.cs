using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//A simple success page with provision to remove all the cart items.
namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                controller.Book.removeAllCartItems();
            }
        }
    }
}