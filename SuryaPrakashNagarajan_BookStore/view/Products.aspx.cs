using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Dictionary<string, JObject> productsDictionary;

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery.validate.unobtrusive.min.js",
                DebugPath = "~/Scripts/jquery.validate.unobtrusive.min.js"
            });

            if (!IsPostBack)
            {
                PopulateProductsList();
            }

        }

        private void PopulateProductsList()
        {

            //Populate Genre List
            List<model.Genre> allGenres = controller.Book.GetAllGenres();

            GenreList.Items.Clear();

            GenreList.Items.Add(new ListItem("--select--", ""));

            foreach (var genre in allGenres)
            {
                GenreList.Items.Add(new ListItem(genre.Name, genre.Id+""));
            }


        }

        private void populateBooks(int genreId)
        {
            //Populate Book List
            List<model.Book> allBooks = controller.Book.GetAllBooks(genreId);

            BookList.Items.Clear();

            BookList.Items.Add(new ListItem("--select--", ""));

            foreach (var book in allBooks)
            {
                BookList.Items.Add(new ListItem(book.Name, book.Id + ""));
            }
        }

        protected void RenderBookList(object sender, EventArgs e)
        {
            populateBooks(int.Parse(GenreList.SelectedValue));
        }

        protected void HandleBookSelection(object sender, EventArgs e)
        {
            populateBookDetails(int.Parse(BookList.SelectedValue));
        }

        protected void populateBookDetails(int bookId)
        {
            model.Book book = controller.Book.getBookData(bookId);
            Title.Text = book.Name;
            Description.Text = book.Description;
            Price.Text = "$ " +book.Price;
            BookCover.ImageUrl = book.ImagePath;
        }

        protected void addToCartButton(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                controller.Book.insertOrUpdateCartItem(int.Parse(BookList.SelectedValue), int.Parse(Quantity.Text));
            }
        }

        protected void goToCartButton(object sender, EventArgs e)
        {
            Response.Redirect("/view/Cart.aspx");
        }
    }
}