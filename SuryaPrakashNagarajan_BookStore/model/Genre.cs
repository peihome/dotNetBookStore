namespace SuryaPrakashNagarajan_BookStore.model
{
    public class Genre : DbContext
    {
        public Genres()
            : base("name=Genres")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }

        public virtual DbSet<Book> Book { get; set; }
    }
}
