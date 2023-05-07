using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Tournaments
{
    public class TournamentService : ITournamentService
    {
        private readonly DataContext _dbContext;

        public TournamentService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Tournament> AddAsync(Tournament entity)
        {
            await _dbContext.Tournaments.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Tournament>> AddRangeAsync(List<Tournament> entities)
        {
            await _dbContext.Tournaments.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {

            try
            {
                var existingData = await _dbContext.Tournaments.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Tournaments.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Tournament> GetAsync(Expression<Func<Tournament, bool>> expression) => await _dbContext.Tournaments.SingleOrDefaultAsync(expression);

        public async Task<List<Tournament>> ListAsync(Expression<Func<Tournament, bool>> expression) => await _dbContext.Tournaments.Where(expression).ToListAsync();

        public async Task<List<Tournament>> ListAsync() => await _dbContext.Tournaments.Where(tournament => tournament.Active).ToListAsync();

        public async Task<bool> UpdateAsync(Tournament entity)
        {
            try
            {
                var existingData = await _dbContext.Tournaments.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

                if (existingData == null) return false;

                existingData.Name = entity.Name;
                existingData.StartDate = entity.StartDate;
                existingData.EndDate = entity.EndDate;
                existingData.VenuePlace = entity.VenuePlace;
                existingData.VenueAddress = entity.VenueAddress;
                existingData.VenueCity = entity.VenueCity;
                existingData.VenueCountry = entity.VenueCountry;
                existingData.NumberOfSlots = entity.NumberOfSlots;

                _dbContext.Tournaments.Update(existingData);

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