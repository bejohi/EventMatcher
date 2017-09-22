using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace DatabaseModel.Model
{
    [Table("UserLogging")]
    public partial class UserLogging
    {
        
        public UserLogging()
        {
            UserLoginTry = new HashSet<UserLoginTry>();
        }

        public int Id { get; set; }

        public int UserId { get; set; }

        public bool EMailConfirmed { get; set; }

        public bool? Blocked { get; set; }

        public DateTime TimeOfCreation { get; set; }

        public int User_Id { get; set; }

        public virtual User User { get; set; }

        
        public virtual ICollection<UserLoginTry> UserLoginTry { get; set; }
    }
}
