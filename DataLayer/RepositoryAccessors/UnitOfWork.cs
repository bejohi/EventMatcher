namespace DataRepositories
{
    using DatabaseModel;
    using Microsoft.EntityFrameworkCore;


    public class UnitOfWork : IUnitOfWork
    {

        private readonly EventMatcherModelContext context;

        public UnitOfWork(EventMatcherModelContext context = null)
        {
            if (context == null)
            {
                // TODO: Add connectionstring
                var contextOptions = new DbContextOptions<EventMatcherModelContext>();
                context = new EventMatcherModelContext(contextOptions);
            }
            this.context = context;
        }

    }

    public interface IUnitOfWork
    {

    }
}
