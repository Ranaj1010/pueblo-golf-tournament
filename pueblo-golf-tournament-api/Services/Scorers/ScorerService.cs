using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Scorers
{
    public class ScorerService : IScorerService
    {

        private readonly DataContext _dbContext;

        public ScorerService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Scorer> AddAsync(Scorer entity)
        {
            await _dbContext.Scorers.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Scorer>> AddRangeAsync(List<Scorer> entities)
        {
            await _dbContext.Scorers.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Scorers.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Scorers.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Scorer> GetAsync(Expression<Func<Scorer, bool>> expression) => await _dbContext.Scorers.SingleOrDefaultAsync(expression);

        public async Task<List<Scorer>> ListAsync(Expression<Func<Scorer, bool>> expression) => await _dbContext.Scorers.Where(expression).ToListAsync();

        public async Task<List<Scorer>> ListAsync() => await _dbContext.Scorers.Where(tournament => tournament.Active).ToListAsync();

        public async Task<Scorer> UpdateAsync(Scorer entity)
        {
            var existingData = await _dbContext.Scorers.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;
            
            _dbContext.Scorers.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;
        }
    }
}