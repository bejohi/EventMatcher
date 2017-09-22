namespace DatabaseModel.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("TimeSlot")]
    public class TimeSlot
    {
        public TimeSlot()
        {
            Group = new HashSet<Group>();
            Session = new HashSet<Session>();
            Status = new HashSet<Status>();
        }

        public int Id { get; set; }

        public DateTime StartTime { get; set; }

        public DateTime EndTime { get; set; }


        public virtual ICollection<Group> Group { get; set; }


        public virtual ICollection<Session> Session { get; set; }


        public virtual ICollection<Status> Status { get; set; }
    }
}