using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace SuryaPrakashNagarajan_BookStore.model
{
    public class Genres : DbContext
    {
        public Genres()
            : base("name=Genres")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }

        public virtual DbSet<Genre> Book { get; set; }

    }
}
