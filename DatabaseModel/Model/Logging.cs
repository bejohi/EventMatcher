namespace DatabaseModel.Model
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Logging")]
    public partial class Logging
    {
        public int Id { get; set; }

        [Required]
        public string Details { get; set; }

        public DateTime TimeOfEvent { get; set; }
    }
}
