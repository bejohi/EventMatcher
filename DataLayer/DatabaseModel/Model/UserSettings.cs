using System.Collections.Generic;

namespace DatabaseModel.Model
{
    public partial class UserSettings
    {
        
        public UserSettings()
        {
            User = new HashSet<User>();
            DashboardItem = new HashSet<DashboardItem>();
        }

        public int Id { get; set; }

        public bool? EMailNotification { get; set; }

        
        public virtual ICollection<User> User { get; set; }

        
        public virtual ICollection<DashboardItem> DashboardItem { get; set; }
    }
}
