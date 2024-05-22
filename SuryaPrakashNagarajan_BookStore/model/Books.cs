using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace SuryaPrakashNagarajan_BookStore.model
{
    public class Books : DbContext
    {
        public Books()
            : base("name=Books")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }

        public virtual DbSet<Book> Book { get; set; }
    
    }
}
