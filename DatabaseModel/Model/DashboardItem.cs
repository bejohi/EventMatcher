namespace DatabaseModel.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("DashboardItem")]
    public partial class DashboardItem
    {

        public DashboardItem()
        {
            UserSettings = new HashSet<UserSettings>();
        }

        public int Id { get; set; }

        public string Name { get; set; }


        public virtual ICollection<UserSettings> UserSettings { get; set; }
    }
}
