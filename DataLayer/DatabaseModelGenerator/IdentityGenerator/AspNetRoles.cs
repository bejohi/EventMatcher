namespace DatabaseModel.IdentityGenerator
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class AspNetRoles
    {
        
        public AspNetRoles()
        {
            AspNetUsers = new HashSet<AspNetUsers>();
        }

        public string Id { get; set; }

        [Required]
        public string Name { get; set; }

        
        public virtual ICollection<AspNetUsers> AspNetUsers { get; set; }
    }
}
