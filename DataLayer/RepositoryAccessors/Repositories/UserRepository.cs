namespace DataRepositories.Repositories
{
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using DatabaseModel;
    using DatabaseModel.Model;
    using Interfaces;
    using Microsoft.EntityFrameworkCore;

    public class UserRepository : IUserRepository
    {
        private readonly EventMatcherModelContext _context;

        public UserRepository(EventMatcherModelContext context)
        {
            this._context = context;
        }


        public async Task<IEnumerable<User>> GetUsers()
        {
            return await this._context.User.ToListAsync().ConfigureAwait(false);
        }

        public async Task<User> GetUserById(int id)
        {
            return await this._context.FindAsync<User>(id).ConfigureAwait(false);
        }

        public async Task InsertUser(User user)
        {
            await this._context.User.AddAsync(user).ConfigureAwait(false);
        }

        public async Task DeleteUser(int userId)
        {
            var user = await this.GetUserById(userId).ConfigureAwait(false);
            if (user != null)
            {
                this._context.User.Remove(user);
            }
        }

        public async Task UpdateUser(User user)
        {
            await Task.Run(() => {}).ConfigureAwait(false);
            this._context.Entry(user).State = EntityState.Modified;
        }

        public async Task<int> Save()
        {
            return await this._context.SaveChangesAsync().ConfigureAwait(false);
        }

        public void Dispose()
        {
           this._context.Dispose();
        }
    }
}
