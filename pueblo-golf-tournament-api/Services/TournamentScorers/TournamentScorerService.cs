using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Services.TournamentScorers;

namespace pueblo_golf_tournament_api.Services.TournamentTournamentScorers
{
    public class TournamentScorerService : ITournamentScorerService
    {

        private readonly DataContext _dbContext;

        public TournamentScorerService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<TournamentScorer> AddAsync(TournamentScorer entity)
        {
            await _dbContext.TournamentScorers.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<TournamentScorer>> AddRangeAsync(List<TournamentScorer> entities)
        {
            await _dbContext.TournamentScorers.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.TournamentScorers.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.TournamentScorers.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<TournamentScorer> GetAsync(Expression<Func<TournamentScorer, bool>> expression) => await _dbContext.TournamentScorers.SingleOrDefaultAsync(expression);

        public async Task<List<TournamentScorer>> ListAsync(Expression<Func<TournamentScorer, bool>> expression) => await _dbContext.TournamentScorers.Where(expression).ToListAsync();

        public async Task<List<TournamentScorer>> ListAsync() => await _dbContext.TournamentScorers.Where(tournament => tournament.Active).ToListAsync();

        public async Task<TournamentScorer> UpdateAsync(TournamentScorer entity)
        {
            var existingData = await _dbContext.TournamentScorers.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.TournamentId = entity.TournamentId;

            _dbContext.TournamentScorers.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;
        }
    }
}