namespace DatabaseModel.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Status
    {
        
        public Status()
        {
            Session = new HashSet<Session>();
            TimeSlot = new HashSet<TimeSlot>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        
        public virtual ICollection<Session> Session { get; set; }

        
        public virtual ICollection<TimeSlot> TimeSlot { get; set; }

        
        public virtual ICollection<User> User { get; set; }
    }
}
