using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Teams
{
    public class TeamService : ITeamService
    {
        private readonly DataContext _dbContext;

        public TeamService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Team> AddAsync(Team entity)
        {
            await _dbContext.Teams.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Team>> AddRangeAsync(List<Team> entities)
        {
            await _dbContext.Teams.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Teams.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Teams.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Team> GetAsync(Expression<Func<Team, bool>> expression) => await _dbContext.Teams.SingleOrDefaultAsync(expression);

        public async Task<List<Team>> ListAsync(Expression<Func<Team, bool>> expression) => await _dbContext.Teams.Where(expression).ToListAsync();

        public async Task<List<Team>> ListAsync() => await _dbContext.Teams.Where(tournament => tournament.Active).ToListAsync();

        public async Task<Team> UpdateAsync(Team entity)
        {
                var existingData = await _dbContext.Teams.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

                if (existingData == null) return null;

                existingData.Name = entity.Name;
                existingData.LogoUrl = entity.LogoUrl;

                _dbContext.Teams.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return entity;
        }
    }
}