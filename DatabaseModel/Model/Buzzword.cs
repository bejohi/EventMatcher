using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DatabaseModel.Model
{
    [Table("Buzzword")]
    public partial class Buzzword
    {
        
        public Buzzword()
        {
            User = new HashSet<User>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        
        public virtual ICollection<User> User { get; set; }
    }
}
