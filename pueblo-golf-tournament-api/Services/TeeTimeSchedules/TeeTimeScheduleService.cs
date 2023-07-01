using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.TeeTimeSchedules
{
    public class TeeTimeScheduleService : ITeeTimeScheduleService
    {
        private readonly DataContext _dbContext;
        public TeeTimeScheduleService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<TeeTimeSchedule> AddAsync(TeeTimeSchedule entity)
        {
            await _dbContext.TeeTimeSchedules.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<TeeTimeSchedule>> AddRangeAsync(List<TeeTimeSchedule> entities)
        {
            await _dbContext.TeeTimeSchedules.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.TeeTimeSchedules.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.TeeTimeSchedules.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<TeeTimeSchedule> GetAsync(Expression<Func<TeeTimeSchedule, bool>> expression) => await _dbContext.TeeTimeSchedules.SingleOrDefaultAsync(expression);
        
        public async Task<List<TeeTimeSchedule>> ListAsync(Expression<Func<TeeTimeSchedule, bool>> expression) => await _dbContext.TeeTimeSchedules.Where(expression).ToListAsync();
        
        public async Task<List<TeeTimeSchedule>> ListAsync() => await _dbContext.TeeTimeSchedules.Where(tournament => tournament.Active).ToListAsync();

        public async Task<TeeTimeSchedule> UpdateAsync(TeeTimeSchedule entity)
        {
            var existingData = await _dbContext.TeeTimeSchedules.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.IsFull = entity.IsFull;
            existingData.IsDisabled = entity.IsDisabled;
            existingData.TournamentId = entity.TournamentId;

            _dbContext.TeeTimeSchedules.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;
        }
    }
}