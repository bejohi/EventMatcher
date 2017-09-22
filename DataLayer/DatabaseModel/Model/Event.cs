namespace DatabaseModel.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Event")]
    public partial class Event
    {
        
        public Event()
        {
            Session = new HashSet<Session>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }

        public int CompanyId { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        public virtual Company Company { get; set; }

        
        public virtual ICollection<Session> Session { get; set; }

        
        public virtual ICollection<User> User { get; set; }
    }
}
