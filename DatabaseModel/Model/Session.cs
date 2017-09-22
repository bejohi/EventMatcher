namespace DatabaseModel.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Session")]
    public partial class Session
    {
        
        public Session()
        {
            Group = new HashSet<Group>();
            Status = new HashSet<Status>();
            TimeSlot = new HashSet<TimeSlot>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int Event_Id { get; set; }

        public virtual Event Event { get; set; }

        
        public virtual ICollection<Group> Group { get; set; }

        
        public virtual ICollection<Status> Status { get; set; }

        
        public virtual ICollection<TimeSlot> TimeSlot { get; set; }
    }
}
