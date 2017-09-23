namespace DatabaseModel.IdentityGenerator
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class AspNetUserLogins
    {
        [Key]
        [Column(Order = 0)]
        public string UserId { get; set; }

        [Key]
        [Column(Order = 1)]
        public string LoginProvider { get; set; }

        [Key]
        [Column(Order = 2)]
        public string ProviderKey { get; set; }

        public virtual AspNetUsers AspNetUsers { get; set; }
    }
}
