using DatabaseModel.Model;

namespace DatabaseModel
{
    using Microsoft.EntityFrameworkCore;

    public class EventMatcherModelContext : DbContext
    {
        public EventMatcherModelContext(DbContextOptions<EventMatcherModelContext> options) : base(options)
        {
            
        }

        public virtual DbSet<Buzzword> Buzzword { get; set; }
        public virtual DbSet<Company> Company { get; set; }
        public virtual DbSet<DashboardItem> DashboardItem { get; set; }
        public virtual DbSet<Event> Event { get; set; }
        public virtual DbSet<Group> Group { get; set; }
        public virtual DbSet<Logging> Logging { get; set; }
        public virtual DbSet<Rating> Rating { get; set; }
        public virtual DbSet<Right> Right { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Session> Session { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<TimeSlot> TimeSlot { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserLogging> UserLogging { get; set; }
        public virtual DbSet<UserLoginTry> UserLoginTry { get; set; }
        public virtual DbSet<UserSettings> UserSettings { get; set; }
    }
}
