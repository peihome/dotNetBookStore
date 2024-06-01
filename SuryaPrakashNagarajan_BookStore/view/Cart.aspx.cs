using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Cart page handling driver Class
//Contains code for manupulating the cart activities like remove item / multiple items, empty cart
namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCartList();
            }
        }

        protected void PopulateCartList()
        {
            Dictionary<int, model.Cart> bookIdVsCartItem = controller.Book.getBooksIdsVSCartItemFromCart();

            List<int> bookIds = bookIdVsCartItem.Keys.ToList();
            Dictionary<int, model.Book> bookIdVsBook = controller.Book.GetBooksByIds(bookIds);
            model.Book book = null;
            model.Cart cartItem = null;

            CartList.Items.Clear();

            foreach (int bookId in bookIds)
            {
                bookIdVsBook.TryGetValue(bookId, out book);
                bookIdVsCartItem.TryGetValue(bookId, out cartItem);

                CartList.Items.Add(new ListItem(book.Name + " (" + cartItem.Quantity + " at " + (cartItem.Quantity * book.Price) +")", book.Id + ""));

            }

            if (CartList.Items.Count == 0)
            {
                CartList.Items.Add(new ListItem(""));
                CheckOut.Enabled = false;
                EmptyCart.Enabled = false;
                RemoveItem.Enabled = false;
            }else
            {
                CheckOut.Enabled = true;
                EmptyCart.Enabled = true;
                RemoveItem.Enabled = true;
            }


        }

        protected void RemoveItem_Click(object sender, EventArgs e)
        {
            int[] selectedIndices = CartList.GetSelectedIndices();
            List<int> selectedBookIds = new List<int>();

            foreach (int index in selectedIndices)
            {
                selectedBookIds.Add(int.Parse(CartList.Items[index].Value));
            }

            controller.Book.removeCartItemsByBookIds(selectedBookIds);
            PopulateCartList();
        }

        protected void EmptyCart_Click(object sender, EventArgs e)
        {
            controller.Book.removeAllCartItems();
            PopulateCartList();
        }

        protected void ContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("/view/Products.aspx");
        }

        protected void CheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("/view/Checkout.aspx");
        }
    }
}