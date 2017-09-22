namespace DatabaseModel.Model
{
    using System;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Rating")]
    public partial class Rating
    {
        public int Id { get; set; }

        public DateTime? Time { get; set; }

        public int? Points { get; set; }

        public string Comment { get; set; }

        public int User_Id { get; set; }

        public virtual User User { get; set; }
    }
}
