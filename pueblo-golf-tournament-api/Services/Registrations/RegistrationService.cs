using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Registrations
{
    public class RegistrationService : IRegistrationService
    {
        private readonly DataContext _dbContext;

        public RegistrationService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Registration> AddAsync(Registration entity)
        {
            await _dbContext.Registrations.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Registration>> AddRangeAsync(List<Registration> entities)
        {
            await _dbContext.Registrations.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Registrations.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Registrations.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Registration> GetAsync(Expression<Func<Registration, bool>> expression)=> await _dbContext.Registrations.SingleOrDefaultAsync(expression);

        public async Task<List<Registration>> ListAsync(Expression<Func<Registration, bool>> expression) => await _dbContext.Registrations.Where(expression).ToListAsync();

        public async Task<List<Registration>> ListAsync() => await _dbContext.Registrations.Where(tournament => tournament.Active).ToListAsync();

        public async Task<bool> UpdateAsync(Registration entity)
        {
            try
            {
                var existingData = await _dbContext.Registrations.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

                if (existingData == null) return false;

                existingData.Status = entity.Status;
                existingData.PaymentId = entity.PaymentId;
                existingData.TeamId = entity.TeamId;
                existingData.TournamentId = entity.TournamentId;
                _dbContext.Registrations.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }
    }
}