namespace DatabaseModel.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Role")]
    public partial class Role
    {
        
        public Role()
        {
            Right = new HashSet<Right>();
            User = new HashSet<User>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Name { get; set; }

        
        public virtual ICollection<Right> Right { get; set; }

        
        public virtual ICollection<User> User { get; set; }
    }
}
