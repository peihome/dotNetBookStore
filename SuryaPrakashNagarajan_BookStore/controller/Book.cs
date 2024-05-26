using System;
using System.Collections.Generic;
using System.Linq;
using SuryaPrakashNagarajan_BookStore.model;

namespace SuryaPrakashNagarajan_BookStore.controller
{
    public class Book
    {
        public static List<model.Book> GetAllBooks(int genreId)
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                return context.Books.Where(book => book.Genre_Id.Equals(genreId)).ToList();
            }
        }

        public static List<model.Genre> GetAllGenres()
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                return context.Genres.ToList();
            }
        }

        public static model.Book getBookData(int bookId)
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                return context.Books.Single(book => book.Id == bookId);
            }
        }

        public static model.Cart getCartItemByBookId(int bookId)
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                try
                {
                    return context.Cart.Single(item => item.Book_Id == bookId);
                }catch(Exception e)
                {
                    return null;
                }
                
            }
        }

        public static List<model.Cart> getCartItems()
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                return context.Cart.ToList();
            }
        }

        public static void addCartItem(int bookId, int quantity)
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
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
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
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
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                context.Database.ExecuteSqlCommand("TRUNCATE TABLE Cart");
            }
        }

        public static Dictionary<int, model.Book> GetBooksByIds(List<int> bookIds)
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                var books = context.Books
                    .Where(b => bookIds.Contains(b.Id))
                    .ToDictionary(b => b.Id);

                return books;
            }
        }

        public static List<int> getBooksIdsFromCart()
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                var bookIds = context.Cart.Select(cartItem => cartItem.Book_Id).ToList();

                return bookIds;
       
            }
        }

        public static void removeCartItemsByBookIds(List<int> bookIds)
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                
                var cartItemsToRemove = context.Cart.Where(item => bookIds.Contains(item.Book_Id)).ToList();
                
                context.Cart.RemoveRange(cartItemsToRemove);

                context.SaveChanges();
            }
        }
    }
}
