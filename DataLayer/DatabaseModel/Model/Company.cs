using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DatabaseModel.Model
{
    [Table("Company")]
    public partial class Company
    {
        
        public Company()
        {
            Event = new HashSet<Event>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        
        public virtual ICollection<Event> Event { get; set; }

        
        public virtual ICollection<User> User { get; set; }
    }
}
