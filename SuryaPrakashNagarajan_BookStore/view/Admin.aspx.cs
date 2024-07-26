using Microsoft.SqlServer.Server;
using SuryaPrakashNagarajan_BookStore.model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SuryaPrakashNagarajan_BookStore.view
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGenres();
                BindBooksGridView();
                BindGenresGridView();
            }
        }

        private void BindBooksGridView()
        {
            using (var context = new bookstore_local_dbEntities())
            {
                int genreID = getSelectedGenreIndex();

                var books = from book in context.Books
                            where genreID == 0 || book.Genre_Id == genreID
                            select new
                            {
                                book.Id,
                                book.Name,
                                book.Description,
                                book.Price
                            };

                BooksGridView.DataSource = books.ToList();
                BooksGridView.DataBind();
            }
        }

        private int getSelectedGenreIndex()
        {
            try
            {
                return int.Parse(Genres.SelectedValue);
            }catch
            { 
                return 0; 
            }
            
        }

        protected void BooksGridView_HandlePageChange(object sender, GridViewPageEventArgs e)
        {
            BooksGridView.PageIndex = e.NewPageIndex;
            BindBooksGridView();
        }

        private void BindGenres()
        {
            using (var context = new bookstore_local_dbEntities())
            {
                var genres = from genre in context.Genres
                             select new { genre.Id, genre.Name };

                Genres.DataSource = genres.ToList();
                Genres.DataTextField = "Name";
                Genres.DataValueField = "Id";
                Genres.DataBind();

                Genres.Items.Insert(0, new ListItem("Select a Genre", " --select-- "));
            }
        }
        protected void Genres_HandleGenreChange(object sender, EventArgs e)
        {
            BindBooksGridView();

            showOrHideGenres(true);
            BooksGridView.Visible = true;
            BookDetailsView.Visible = false;
            GenresGridView.Visible = false;
            CancelBtn.Visible = true;
            editGenres.Visible = false;
        }


        // Genre Grid View Code Starts
        private void BindGenresGridView()
        {
            using (var context = new bookstore_local_dbEntities())
            {
                var genres = from genre in context.Genres
                             select new { genre.Id, genre.Name };

                GenresGridView.DataSource = genres.ToList();
                GenresGridView.DataBind();
            }
        }

        protected void GenresGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GenresGridView.EditIndex = e.NewEditIndex;
            BindGenresGridView();
        }

        protected void GenresGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GenresGridView.Rows[e.RowIndex];
            int id = Convert.ToInt32(GenresGridView.DataKeys[e.RowIndex].Values[0]);
            string name = ((TextBox)GenresGridView.Rows[e.RowIndex].FindControl("txtEditGenreName")).Text;

            using (var context = new bookstore_local_dbEntities())
            {
                var genre = context.Genres.FirstOrDefault(g => g.Id == id);
                if (genre != null)
                {
                    genre.Name = name;
                    context.SaveChanges();
                }
            }

            GenresGridView.EditIndex = -1;
            BindGenresGridView();

            int genreID = getSelectedGenreIndex();
            BindGenres(); // Update the DropDownList
            Genres.SelectedIndex = genreID;
        }

        protected void GenresGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GenresGridView.EditIndex = -1;
            BindGenresGridView();
        }

        protected void GenresGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GenresGridView.DataKeys[e.RowIndex].Values[0]);

            using (var context = new bookstore_local_dbEntities())
            {
                var genre = context.Genres.FirstOrDefault(g => g.Id == id);
                if (genre != null)
                {
                    var associatedBooks = context.Books.Any(b => b.Genre_Id == id);
                    if (associatedBooks)
                    {
                        ErrorMessageLabel.Text = "This genre cannot be deleted as it has associated books.";
                        ErrorMessageLabel.Visible = true;
                    }
                    else
                    {
                        context.Genres.Remove(genre);
                        context.SaveChanges();

                        BindGenresGridView();
                        BindGenres(); // Update the DropDownList
                    }
                }
            }
        }

        protected void GenresGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddNew")
            {
                TextBox txtNewGenreName = (TextBox)GenresGridView.FooterRow.FindControl("txtNewGenreName");
                string name = txtNewGenreName.Text;

                using (var context = new bookstore_local_dbEntities())
                {
                    var newGenre = new Genre
                    {
                        Name = name
                    };
                    context.Genres.Add(newGenre);
                    context.SaveChanges();
                }

                BindGenresGridView();
                BindGenres();
            } else if (e.CommandName == "Cancel") {

                showOrHideGenres(false);
                BooksGridView.Visible = false;
                BookDetailsView.Visible = false;
                GenresGridView.Visible = true;
                editGenres.Visible = false;
                CancelBtn.Visible = true;
            }
        }

        // Genre Grid View Code Ends


        // Book Detail View Code Starts
        protected void BooksGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32(BooksGridView.SelectedDataKey.Value);
            using (var context = new bookstore_local_dbEntities())
            {
                var book = from b in context.Books
                           join g in context.Genres on b.Genre_Id equals g.Id
                           where b.Id == bookId
                           select new
                           {
                               b.Id,
                               b.Name,
                               b.Description,
                               b.Price,
                               b.Genre_Id,
                               Genre_Name = g.Name
                           };

                BookDetailsView.DataSource = book.ToList();
                BookDetailsView.DataBind();
            }

            // Switch visibility
            showOrHideGenres(false, "Edit Book Details:");
            BooksGridView.Visible = false;
            BookDetailsView.Visible = true;
            GenresGridView.Visible = false;
            editGenres.Visible = false;
        }
        public void showOrHideGenres(bool operation)
        {
            showOrHideGenres(operation, null);
        }
        public void showOrHideGenres(bool operation, String message)
        {
            Genres.Visible = operation;
            if (message != null)
            {
                GenresLabel.Text = message;
                GenresLabel.CssClass = "placeholder placeHolderCustomClass";
                CancelBtn.Visible = true;
            }
            else
            {
                GenresLabel.Text = "Please select a genre:";
            }
        }

        protected void BookDetailsView_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.CancelingEdit)
            {
                BookDetailsView.ChangeMode(DetailsViewMode.ReadOnly);
            }
            else
            {
                BookDetailsView.ChangeMode(e.NewMode);
            }
            BindSelectedBookDetails(); // Rebind details
        }

        protected void BookDetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            int bookId = Convert.ToInt32(BookDetailsView.DataKey.Value);
            TextBox txtName = (TextBox)BookDetailsView.FindControl("txtName");
            TextBox txtDescription = (TextBox)BookDetailsView.FindControl("txtDescription");
            TextBox txtPrice = (TextBox)BookDetailsView.FindControl("txtPrice");
            DropDownList ddlGenre = (DropDownList)BookDetailsView.FindControl("ddlGenre");

            using (var context = new bookstore_local_dbEntities())
            {
                var book = context.Books.FirstOrDefault(b => b.Id == bookId);
                if (book != null)
                {
                    book.Name = txtName.Text;
                    book.Description = txtDescription.Text;
                    book.Price = Convert.ToDecimal(txtPrice.Text);
                    book.Genre_Id = Convert.ToInt32(ddlGenre.SelectedValue);
                    context.SaveChanges();
                }
            }

            BookDetailsView.ChangeMode(DetailsViewMode.ReadOnly);
            BindSelectedBookDetails(); // Rebind details
            BindBooksGridView(); // Refresh GridView
        }

        protected void BookDetailsView_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
        {
            int bookId = Convert.ToInt32(BookDetailsView.DataKey.Value);
            using (var context = new bookstore_local_dbEntities())
            {
                var book = context.Books.FirstOrDefault(b => b.Id == bookId);
                if (book != null)
                {
                    context.Books.Remove(book);
                    context.SaveChanges();
                }
            }

            BindBooksGridView(); // Refresh GridView
            BookDetailsView.Visible = false;
            BooksGridView.Visible = true;
        }

        protected void BookDetailsView_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            TextBox txtName = (TextBox)BookDetailsView.FindControl("TextBox1");
            TextBox txtDescription = (TextBox)BookDetailsView.FindControl("TextBox2");
            TextBox txtPrice = (TextBox)BookDetailsView.FindControl("TextBox3");
            DropDownList ddlGenre = (DropDownList)BookDetailsView.FindControl("ddlGenreInsert");
            int newBookId = 0;

            using (var context = new bookstore_local_dbEntities())
            {
                var newBook = new Book
                {
                    Name = txtName.Text,
                    Description = txtDescription.Text,
                    Price = Convert.ToDecimal(txtPrice.Text),
                    Genre_Id = Convert.ToInt32(ddlGenre.SelectedValue)
                };
                context.Books.Add(newBook);
                context.SaveChanges();
                newBookId = newBook.Id;
            }

            BookDetailsView.ChangeMode(DetailsViewMode.ReadOnly);
            BindSelectedBookDetails(newBookId); // Rebind details
            BindBooksGridView(); // Refresh GridView
        }

        private void BindSelectedBookDetails()
        {
            BindSelectedBookDetails(0);
        }

        private void BindSelectedBookDetails(int bookIdParam)
        {
            if (BooksGridView.SelectedIndex >= 0)
            {
                int bookId = bookIdParam >0 ? bookIdParam : Convert.ToInt32(BooksGridView.SelectedDataKey.Value);
                using (var context = new bookstore_local_dbEntities())
                {
                    var book = from b in context.Books
                               join g in context.Genres on b.Genre_Id equals g.Id
                               where b.Id == bookId
                               select new
                               {
                                   b.Id,
                                   b.Name,
                                   b.Description,
                                   b.Price,
                                   b.Genre_Id,
                                   Genre_Name = g.Name
                               };

                    BookDetailsView.DataSource = book.ToList();
                    BookDetailsView.DataBind();
                    BookDetailsView_DataBound();
                }
            }
        }

        protected void BookDetailsView_DataBound()
        {
            if (BookDetailsView.CurrentMode == DetailsViewMode.Edit)
            {
                DropDownList ddlGenre = BookDetailsView.FindControl("ddlGenre") as DropDownList;

                if (ddlGenre != null)
                {
                    using (var context = new bookstore_local_dbEntities())
                    {
                        var genres = from genre in context.Genres
                                     select new { genre.Id, genre.Name };

                        ddlGenre.DataSource = genres.ToList();
                        ddlGenre.DataTextField = "Name";
                        ddlGenre.DataValueField = "Id";
                        ddlGenre.DataBind();
                    }
                    int genreId = (int)DataBinder.Eval(BookDetailsView.DataItem, "Genre_Id");
                    ddlGenre.SelectedValue = genreId.ToString();
                }
            }
        }

        protected void BookDetailsView_ItemCreated(object sender, EventArgs e)
        {
            if (BookDetailsView.CurrentMode == DetailsViewMode.Insert)
            {
                DropDownList ddlGenre = BookDetailsView.FindControl("ddlGenreInsert") as DropDownList;

                if (ddlGenre != null)
                {
                    using (var context = new bookstore_local_dbEntities())
                    {
                        var genres = from genre in context.Genres
                                     select new { genre.Id, genre.Name };

                        ddlGenre.DataSource = genres.ToList();
                        ddlGenre.DataTextField = "Name";
                        ddlGenre.DataValueField = "Id";
                        ddlGenre.DataBind();
                    }
                }
            }
        }

        protected void showEditGenres(object sender, EventArgs e)
        {
            showOrHideGenres(false, "Edit Genres:");
            BooksGridView.Visible = false;
            BookDetailsView.Visible = false;
            GenresGridView.Visible = true;
            editGenres.Visible = false;
        }

        protected void handleCancelEdit(object sender, EventArgs e)
        {
            showOrHideGenres(true);
            Genres.SelectedValue = " --select-- ";

            BooksGridView.Visible = false;
            BookDetailsView.Visible = false;
            GenresGridView.Visible = false;
            CancelBtn.Visible = false;
            editGenres.Visible = true;
            ErrorMessageLabel.Visible = false;
        }

        // Book Detail View Code Ends
    }

}