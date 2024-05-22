using System.ComponentModel.DataAnnotations;

namespace SuryaPrakashNagarajan_BookStore.controller
{
    public class Product
    {
        [Key]
        public int id { get; set; }
        public string title { get; set; }
        public double price { get; set; }
        public string description { get; set; }
        public string genre_id { get; set; }
    }
}
