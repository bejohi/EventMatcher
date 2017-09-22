using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace DatabaseModel.Model
{
    [Table("UserLoginTry")]
    public partial class UserLoginTry
    {
        public int Id { get; set; }

        public int UserLoggingId { get; set; }

        public DateTime Time { get; set; }

        public int? Succeded { get; set; }

        public virtual UserLogging UserLogging { get; set; }
    }
}
