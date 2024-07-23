using System;
using System.Collections.Generic;
using System.Linq;
using SuryaPrakashNagarajan_BookStore.model;

//This file contains code that is used by other classes for CRUD operations.
//The method name is self explanatory.
namespace SuryaPrakashNagarajan_BookStore.controller
{
    public class Book
    {
        public static List<model.Book> GetAllBooks(int genreId)
        {
            using (var context = new bookstore_local_dbEntities())
            {
                return context.Books.Where(book => book.Genre_Id == genreId).ToList();
            }
        }

        public static List<model.Genre> GetAllGenres()
        {
            using (var context = new bookstore_local_dbEntities())
            {
                return context.Genres.ToList();
            }
        }

        public static model.Book getBookData(int bookId)
        {
            using (var context = new bookstore_local_dbEntities())
            {
                return context.Books.Single(book => book.Id == bookId);
            }
        }

        public static model.Cart getCartItemByBookId(int bookId)
        {
            using (var context = new bookstore_local_dbEntities())
            {
                try
                {
                    return context.Cart.Single(item => item.Book_Id == bookId);
                }catch(Exception)
                {
                    return null;
                }
                
            }
        }

        public static List<model.Cart> getCartItems()
        {
            using (var context = new bookstore_local_dbEntities())
            {
                return context.Cart.ToList();
            }
        }

        public static void addCartItem(int bookId, int quantity)
        {
            using (var context = new bookstore_local_dbEntities())
            {
                var cartItem = new Cart
                {
                    Book_Id = bookId,
                    Quantity = quantity
                };

                context.Cart.Add(cartItem);
                context.SaveChanges();

            }
        }

        public static void increaseQuantityByBookId(int bookId, int quantity)
        {
            using (var context = new bookstore_local_dbEntities())
            {
                var cartItem = context.Cart.SingleOrDefault(item => item.Book_Id == bookId);

                if (cartItem.Quantity + quantity > 20)
                {
                    cartItem.Quantity = 20;
                }
                else
                {
                    cartItem.Quantity = cartItem.Quantity + quantity;
                }
                
                context.SaveChanges();

            }
        }

        public static void insertOrUpdateCartItem(int bookId, int quantity)
        {
            var cartItem = getCartItemByBookId(bookId);
            if (cartItem == null)
            {
                addCartItem(bookId, quantity);
            }else
            {
                increaseQuantityByBookId(bookId, quantity);
            }
        }

        public static void removeAllCartItems()
        {
            using (var context = new bookstore_local_dbEntities())
            {
                context.Database.ExecuteSqlCommand("TRUNCATE TABLE Cart");
            }
        }

        public static Dictionary<int, model.Book> GetBooksByIds(List<int> bookIds)
        {
            using (var context = new bookstore_local_dbEntities())
            {
                var bookIdVsBookItem = context.Books
                    .Where(b => bookIds.Contains(b.Id))
                    .ToDictionary(b => b.Id);

                return bookIdVsBookItem;
            }
        }

        public static Dictionary<int, model.Cart> getBooksIdsVSCartItemFromCart()
        {
            using (var context = new bookstore_local_dbEntities())
            {
                var bookIdVsCartItem = context.Cart
                    .ToDictionary(b => b.Book_Id);

                return bookIdVsCartItem;

            }
        }

        public static void removeCartItemsByBookIds(List<int> bookIds)
        {
            using (var context = new bookstore_local_dbEntities())
            {
                
                var cartItemsToRemove = context.Cart.Where(item => bookIds.Contains(item.Book_Id)).ToList();
                
                context.Cart.RemoveRange(cartItemsToRemove);

                context.SaveChanges();
            }
        }
    }
}
