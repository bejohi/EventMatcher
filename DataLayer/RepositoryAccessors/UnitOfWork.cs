namespace DataRepositories
{
    using System;
    using DatabaseModel;
    using Microsoft.EntityFrameworkCore;
    using Repositories;
    using Repositories.Interfaces;


    public class UnitOfWork : IUnitOfWork
    {

        private readonly EventMatcherModelContext context;
        private IUserRepository userRepository;

        public UnitOfWork(EventMatcherModelContext context = null)
        {
            if (context == null)
            {
                var contextOptionBuilder = new DbContextOptionsBuilder<EventMatcherModelContext>();
                contextOptionBuilder.UseSqlServer("");
                context = new EventMatcherModelContext(contextOptionBuilder.Options);
            }
            this.context = context;
        }

        public IUserRepository UserRepository
        {
            get
            {
                if (this.userRepository == null)
                {
                    this.userRepository = new UserRepository(this.context);
                }
                return userRepository;
            }
        }

        public void Dispose()
        {
            this.context?.Dispose();
        }
    }

    public interface IUnitOfWork : IDisposable
    {
        IUserRepository UserRepository { get; }
    }
}
