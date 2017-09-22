namespace DatabaseModel.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Group")]
    public partial class Group
    {
        
        public Group()
        {
            TimeSlot = new HashSet<TimeSlot>();
            Session = new HashSet<Session>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        
        public virtual ICollection<TimeSlot> TimeSlot { get; set; }

        
        public virtual ICollection<Session> Session { get; set; }

        
        public virtual ICollection<User> User { get; set; }
    }
}
