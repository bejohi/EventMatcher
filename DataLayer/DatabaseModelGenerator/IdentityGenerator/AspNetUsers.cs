namespace DatabaseModel.IdentityGenerator
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class AspNetUsers
    {
        
        public AspNetUsers()
        {
            AspNetUserClaims = new HashSet<AspNetUserClaims>();
            AspNetUserLogins = new HashSet<AspNetUserLogins>();
            AspNetRoles = new HashSet<AspNetRoles>();
        }

        public string Id { get; set; }

        public string UserName { get; set; }

        public string PasswordHash { get; set; }

        public string SecurityStamp { get; set; }

        [Required]
        [StringLength(128)]
        public string Discriminator { get; set; }

        
        public virtual ICollection<AspNetUserClaims> AspNetUserClaims { get; set; }

        
        public virtual ICollection<AspNetUserLogins> AspNetUserLogins { get; set; }

        
        public virtual ICollection<AspNetRoles> AspNetRoles { get; set; }
    }
}
