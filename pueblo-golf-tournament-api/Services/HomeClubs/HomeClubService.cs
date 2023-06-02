using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.HomeClubs
{
    public class HomeClubService : IHomeClubService
    {
        private readonly DataContext _dbContext;

        public HomeClubService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<HomeClub> AddAsync(HomeClub entity)
        {
            await _dbContext.HomeClubs.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<HomeClub>> AddRangeAsync(List<HomeClub> entities)
        {
            await _dbContext.HomeClubs.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.HomeClubs.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.HomeClubs.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<HomeClub> GetAsync(Expression<Func<HomeClub, bool>> expression) => await _dbContext.HomeClubs.SingleOrDefaultAsync(expression);

        public async Task<List<HomeClub>> ListAsync(Expression<Func<HomeClub, bool>> expression) => await _dbContext.HomeClubs.Where(expression).ToListAsync();

        public async Task<List<HomeClub>> ListAsync() => await _dbContext.HomeClubs.Where(tournament => tournament.Active).ToListAsync();

        public async Task<HomeClub> UpdateAsync(HomeClub entity)
        {
            var existingData = await _dbContext.HomeClubs.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.Name = entity.Name;
            existingData.Address = entity.Address;
            existingData.City = entity.City;
            existingData.Province = entity.Province;
            existingData.Country = entity.Country;

            _dbContext.HomeClubs.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;
        }
    }
}