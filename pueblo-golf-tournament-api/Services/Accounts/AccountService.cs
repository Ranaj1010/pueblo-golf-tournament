using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Accounts
{
    public class AccountService : IAccountService
    {
        private readonly DataContext _dbContext;

        public AccountService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Account> AddAsync(Account entity)
        {
            await _dbContext.Accounts.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Account>> AddRangeAsync(List<Account> entities)
        {
            await _dbContext.Accounts.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Accounts.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Accounts.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Account> GetAsync(Expression<Func<Account, bool>> expression) => await _dbContext.Accounts.SingleOrDefaultAsync(expression);

        public async Task<List<Account>> ListAsync(Expression<Func<Account, bool>> expression) => await _dbContext.Accounts.Where(expression).ToListAsync();

        public async Task<List<Account>> ListAsync() => await _dbContext.Accounts.Where(tournament => tournament.Active).ToListAsync();

        public async Task<Account> UpdateAsync(Account entity)
        {
            var existingData = await _dbContext.Accounts.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.Username = entity.Username;
            existingData.Password = entity.Password;

            _dbContext.Accounts.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;

        }
    }
}