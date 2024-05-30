using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class Products : System.Web.UI.Page
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

            BookList.Items.Add(new ListItem("--select--",""));

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
            if (GenreList.SelectedValue != "")
            {
                populateBooks(int.Parse(GenreList.SelectedValue));
            }else
            {
                resetBookList();
                removeBookSelection();
            }
            
        }

        protected void resetBookList()
        {
            BookList.Items.Clear();
            BookList.Items.Add(new ListItem("--select--", ""));
        }

        protected void HandleBookSelection(object sender, EventArgs e)
        {
            dynamic bookId = BookList.SelectedValue;

            if (bookId != "")
            {
                populateBookDetails(int.Parse(bookId));
            }else
            {
                removeBookSelection();
            }
            
        }

        protected void removeBookSelection()
        {
            Title.Text = "";
            Description.Text = "";
            Price.Text = "";
            BookCover.ImageUrl = "";
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