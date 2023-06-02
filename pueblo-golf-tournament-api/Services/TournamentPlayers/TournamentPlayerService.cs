using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.TournamentPlayers
{
    public class TournamentPlayerService : ITournamentPlayerService
    {
        private readonly DataContext _dbContext;

        public TournamentPlayerService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<TournamentPlayer> AddAsync(TournamentPlayer entity)
        {
            await _dbContext.TournamentPlayers.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<TournamentPlayer>> AddRangeAsync(List<TournamentPlayer> entities)
        {
            await _dbContext.TournamentPlayers.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }
        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.TournamentPlayers.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.TournamentPlayers.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }
        public async Task<TournamentPlayer> GetAsync(Expression<Func<TournamentPlayer, bool>> expression) => await _dbContext.TournamentPlayers.SingleOrDefaultAsync(expression);
        public async Task<List<TournamentPlayer>> ListAsync(Expression<Func<TournamentPlayer, bool>> expression)=> await _dbContext.TournamentPlayers.Where(expression).ToListAsync();
        public async Task<List<TournamentPlayer>> ListAsync() => await _dbContext.TournamentPlayers.Where(tournamentPlayer => tournamentPlayer.Active).ToListAsync();
        public Task<TournamentPlayer> UpdateAsync(TournamentPlayer entity)
        {
            throw new NotImplementedException();
        }
    }
}