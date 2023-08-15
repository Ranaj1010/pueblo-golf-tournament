using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.TournamentPlayerScores
{
    public class TournamentPlayerScoreService : ITournamentPlayerScoreService
    {
        private readonly DataContext _dbContext;
        public TournamentPlayerScoreService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<TournamentPlayerScore> AddAsync(TournamentPlayerScore entity)
        {
            await _dbContext.TournamentPlayerScores.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<TournamentPlayerScore>> AddRangeAsync(List<TournamentPlayerScore> entities)
        {
            await _dbContext.TournamentPlayerScores.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.TournamentPlayerScores.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.TournamentPlayerScores.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<TournamentPlayerScore> GetAsync(Expression<Func<TournamentPlayerScore, bool>> expression) => await _dbContext.TournamentPlayerScores.SingleOrDefaultAsync(expression);

        public async Task<List<TournamentPlayerScore>> ListAsync(Expression<Func<TournamentPlayerScore, bool>> expression) => await _dbContext.TournamentPlayerScores.Where(expression).ToListAsync();

        public async Task<List<TournamentPlayerScore>> ListAsync() => await _dbContext.TournamentPlayerScores.Where(tournament => tournament.Active).ToListAsync();

        public async Task<TournamentPlayerScore> UpdateAsync(TournamentPlayerScore entity)
        {
            var existingData = await _dbContext.TournamentPlayerScores.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.ActualStrokes = entity.ActualStrokes;
            existingData.MolaveScore = entity.MolaveScore;

            _dbContext.TournamentPlayerScores.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return existingData;
        }
    }
}