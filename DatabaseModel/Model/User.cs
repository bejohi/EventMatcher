using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DatabaseModel.Model
{
    [Table("User")]
    public partial class User
    {
        
        public User()
        {
            Rating = new HashSet<Rating>();
            UserLogging = new HashSet<UserLogging>();
            Buzzword = new HashSet<Buzzword>();
            Event = new HashSet<Event>();
            Company = new HashSet<Company>();
            Group = new HashSet<Group>();
            Role = new HashSet<Role>();
            Status = new HashSet<Status>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }

        [Required]
        [StringLength(256)]
        public string EMail { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public DateTime Birthday { get; set; }

        public int UserSettings_Id { get; set; }

        
        public virtual ICollection<Rating> Rating { get; set; }

        
        public virtual ICollection<UserLogging> UserLogging { get; set; }

        public virtual UserSettings UserSettings { get; set; }

        
        public virtual ICollection<Buzzword> Buzzword { get; set; }

        
        public virtual ICollection<Event> Event { get; set; }

        
        public virtual ICollection<Company> Company { get; set; }

        
        public virtual ICollection<Group> Group { get; set; }

        
        public virtual ICollection<Role> Role { get; set; }

        
        public virtual ICollection<Status> Status { get; set; }
    }
}
