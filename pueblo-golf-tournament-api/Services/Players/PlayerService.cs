using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Players
{
    public class PlayerService : IPlayerService
    {
        private readonly DataContext _dbContext;

        public PlayerService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Player> AddAsync(Player entity)
        {
            await _dbContext.Players.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Player>> AddRangeAsync(List<Player> entities)
        {
            await _dbContext.Players.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Players.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Players.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Player> GetAsync(Expression<Func<Player, bool>> expression) => await _dbContext.Players.SingleOrDefaultAsync(expression);

        public async Task<List<Player>> ListAsync(Expression<Func<Player, bool>> expression) => await _dbContext.Players.Where(expression).ToListAsync();

        public async Task<List<Player>> ListAsync() => await _dbContext.Players.Where(tournament => tournament.Active).ToListAsync();

        public async Task<bool> UpdateAsync(Player entity)
        {
            try
            {
                var existingData = await _dbContext.Players.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

                if (existingData == null) return false;

                existingData.Handicap = entity.Handicap;
                existingData.WorldHandicapSystemId = entity.WorldHandicapSystemId;
                existingData.HomeClub = entity.HomeClub;
                existingData.PlayerType = entity.PlayerType;
                existingData.PersonId = entity.PersonId;

                _dbContext.Players.Update(existingData);

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