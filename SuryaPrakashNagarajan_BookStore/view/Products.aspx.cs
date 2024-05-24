using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using SuryaPrakashNagarajan_BookStore.controller;
using SuryaPrakashNagarajan_BookStore.model;

namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Dictionary<string, JObject> productsDictionary;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateProductsList();
            }

            PopulateProductDetails();
        }

        private void PopulateProductsList()
        {

            List<model.Book> allBooks = Product.GetAllBookNames();

            DropDownList1.Items.Clear();

            foreach (var book in allBooks)
            {
                DropDownList1.Items.Add(new ListItem(book.Name, book.Name));
            }

        }

        private void PopulateProductDetails() => productsDictionary = new Dictionary<string, JObject>
            {
                { "Surya", JObject.Parse("{ 'title': 'Product 1', 'price': 10.99, 'description': 'Description of Product 1' }") },
                { "Item 2", JObject.Parse("{ 'title': 'Product 2', 'price': 20.99, 'description': 'Description of Product 2' }") },
                { "Item 3", JObject.Parse("{ 'title': 'Product 3', 'price': 30.99, 'description': 'Description of Product 3' }") },
                { "Item 4", JObject.Parse("{ 'title': 'Product 4', 'price': 40.99, 'description': 'Description of Product 4' }") }
            };

        protected void ProductsList_RenderProductDetails(object sender, EventArgs e)
        {
            // Get the selected item
            string selectedItem = DropDownList1.SelectedItem.Text;
            string selectedValue = DropDownList1.SelectedValue;

            if (productsDictionary.TryGetValue(selectedValue, out JObject book))
            {
                title.Text = book["title"].ToString();
                description.Text = book["description"].ToString();
                price.Text = book["price"].ToString();
            }
        }

        protected void addToCartButton(object sender, EventArgs e)
        {
            // Action to perform when Button 1 is clicked
            //Label1.Text = "Button 1 was clicked!";
        }

        protected void goToCartButton(object sender, EventArgs e)
        {
            // Action to perform when Button 2 is clicked
            //Label1.Text = "Button 2 was clicked!";
        }
    }
}