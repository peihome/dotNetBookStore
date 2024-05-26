﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            List<int> bookIds = controller.Book.getBooksIdsFromCart();
            Dictionary<int, model.Book> bookIdVsBook = controller.Book.GetBooksByIds(bookIds);
            model.Book book = null;

            CartList.Items.Clear();

            foreach (int bookId in bookIds)
            {
                bookIdVsBook.TryGetValue(bookId, out book);
                CartList.Items.Add(new ListItem(book.Name, book.Id + ""));

            }

            if (CartList.Items.Count == 0)
            {
                CartList.Items.Add(new ListItem(""));
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