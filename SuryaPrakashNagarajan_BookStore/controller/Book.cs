using System.Collections.Generic;
using System.Linq;
using SuryaPrakashNagarajan_BookStore.model;

namespace SuryaPrakashNagarajan_BookStore.controller
{
    public class Book
    {
        public static List<model.Book> GetAllBookNames()
        {
            using (var context = new suryaprakashnagarajan_bookstoreEntities())
            {
                return context.Books.ToList();
            }
        }
    }
}
