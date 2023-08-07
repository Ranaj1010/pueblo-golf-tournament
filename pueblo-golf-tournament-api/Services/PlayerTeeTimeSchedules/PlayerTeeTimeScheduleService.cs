using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.PlayerTeeTimeSchedules
{
    public class PlayerTeeTimeScheduleService : IPlayerTeeTimeScheduleService
    {
        private readonly DataContext _dbContext;
        public PlayerTeeTimeScheduleService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<PlayerTeeTimeSchedule> AddAsync(PlayerTeeTimeSchedule entity)
        {
            await _dbContext.PlayerTeeTimeSchedules.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<PlayerTeeTimeSchedule>> AddRangeAsync(List<PlayerTeeTimeSchedule> entities)
        {
            await _dbContext.PlayerTeeTimeSchedules.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.PlayerTeeTimeSchedules.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.PlayerTeeTimeSchedules.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<PlayerTeeTimeSchedule> GetAsync(Expression<Func<PlayerTeeTimeSchedule, bool>> expression) => await _dbContext.PlayerTeeTimeSchedules.SingleOrDefaultAsync(expression);

        public async Task<List<PlayerTeeTimeSchedule>> ListAsync(Expression<Func<PlayerTeeTimeSchedule, bool>> expression) => await _dbContext.PlayerTeeTimeSchedules.Where(expression).ToListAsync();

        public async Task<List<PlayerTeeTimeSchedule>> ListAsync() => await _dbContext.PlayerTeeTimeSchedules.Where(tournament => tournament.Active).ToListAsync();

        public async Task<PlayerTeeTimeSchedule> UpdateAsync(PlayerTeeTimeSchedule entity)
        {
            var existingData = await _dbContext.PlayerTeeTimeSchedules.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.TeeTimeScheduleId = entity.TeeTimeScheduleId;
            existingData.PlayerId = entity.PlayerId;

            _dbContext.PlayerTeeTimeSchedules.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;
        }
    }
}