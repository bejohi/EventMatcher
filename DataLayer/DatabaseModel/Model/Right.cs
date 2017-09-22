namespace DatabaseModel.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Right")]
    public partial class Right
    {
        
        public Right()
        {
            Role = new HashSet<Role>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        
        public virtual ICollection<Role> Role { get; set; }
    }
}
