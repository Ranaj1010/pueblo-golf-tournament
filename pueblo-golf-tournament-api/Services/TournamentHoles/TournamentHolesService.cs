using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.TournamentHoles
{
    public class TournamentHolesService : ITournamentHolesService
    {
        private readonly DataContext _dbContext;
        public TournamentHolesService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<TournamentHole> AddAsync(TournamentHole entity)
        {
            await _dbContext.TournamentHoles.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<TournamentHole>> AddRangeAsync(List<TournamentHole> entities)
        {
            await _dbContext.TournamentHoles.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.TournamentHoles.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.TournamentHoles.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<TournamentHole> GetAsync(Expression<Func<TournamentHole, bool>> expression) => await _dbContext.TournamentHoles.SingleOrDefaultAsync(expression);

        public async Task<List<TournamentHole>> ListAsync(Expression<Func<TournamentHole, bool>> expression) => await _dbContext.TournamentHoles.Where(expression).ToListAsync();

        public async Task<List<TournamentHole>> ListAsync() => await _dbContext.TournamentHoles.Where(tournament => tournament.Active).ToListAsync();

        public async  Task<TournamentHole> UpdateAsync(TournamentHole entity)
        {
            var existingData = await _dbContext.TournamentHoles.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.HoleNumber = entity.HoleNumber;
            existingData.MaximumStrokes = entity.MaximumStrokes;

            _dbContext.TournamentHoles.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return existingData;
        }
    }
}