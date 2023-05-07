using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Divisions
{
    public class DivisionService : IDivisionService
    {
        private readonly DataContext _dbContext;

        public DivisionService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Division> AddAsync(Division entity)
        {
            await _dbContext.Divisions.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Division>> AddRangeAsync(List<Division> entities)
        {
            await _dbContext.Divisions.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Divisions.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Divisions.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Division> GetAsync(Expression<Func<Division, bool>> expression) => await _dbContext.Divisions.SingleOrDefaultAsync(expression);

        public async Task<List<Division>> ListAsync(Expression<Func<Division, bool>> expression) => await _dbContext.Divisions.Where(expression).ToListAsync();

        public async Task<List<Division>> ListAsync() => await _dbContext.Divisions.Where(tournament => tournament.Active).Join(_dbContext.Tournaments, division => division.TournamentId, tournament => tournament.Id, (division, tournament) => new Division
        {
            Id = division.Id,
            Name = division.Name,
            Active = division.Active,
            TournamentId = division.TournamentId,
            CreatedAt = division.CreatedAt,
            ArchivedAt = division.ArchivedAt,            
            Tournament = tournament,
        }).ToListAsync();

        public async Task<bool> UpdateAsync(Division entity)
        {
            try
            {
                var existingData = await _dbContext.Divisions.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

                if (existingData == null) return false;

                existingData.Name = entity.Name;

                _dbContext.Divisions.Update(existingData);

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