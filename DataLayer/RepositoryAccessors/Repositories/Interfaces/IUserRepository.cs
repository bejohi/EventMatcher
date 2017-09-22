namespace DataRepositories.Repositories.Interfaces
{
    using System;
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using DatabaseModel.Model;

    public interface IUserRepository : IDisposable
    {
        Task<IEnumerable<User>> GetUsers();
        Task<User> GetUserById(int id);
        Task InsertUser(User user);
        Task DeleteUser(int userId);
        Task UpdateUser(User user);
        Task<int> Save();
    }
}
