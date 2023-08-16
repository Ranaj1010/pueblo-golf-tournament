using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.TournamentTeamDivisions
{
    public class TournamentTeamDivisionService : ITournamentTeamDivisionService
    {
        private readonly DataContext _dbContext;

        public TournamentTeamDivisionService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<TournamentTeamDivision> AddAsync(TournamentTeamDivision entity)
        {
            await _dbContext.TournamentTeamDivisions.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<TournamentTeamDivision>> AddRangeAsync(List<TournamentTeamDivision> entities)
        {
            await _dbContext.TournamentTeamDivisions.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.TournamentTeamDivisions.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.TournamentTeamDivisions.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<TournamentTeamDivision> GetAsync(Expression<Func<TournamentTeamDivision, bool>> expression) => await _dbContext.TournamentTeamDivisions.SingleOrDefaultAsync(expression);

        public async Task<List<TournamentTeamDivision>> ListAsync(Expression<Func<TournamentTeamDivision, bool>> expression) => await _dbContext.TournamentTeamDivisions.Where(expression).ToListAsync();

        public async Task<List<TournamentTeamDivision>> ListAsync() => await _dbContext.TournamentTeamDivisions.Where(tournament => tournament.Active).ToListAsync();

        public async Task<TournamentTeamDivision> UpdateAsync(TournamentTeamDivision entity)
        {
            var existingData = await _dbContext.TournamentTeamDivisions.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.TournamentId = entity.TournamentId;

            _dbContext.TournamentTeamDivisions.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;
        }
    }
}