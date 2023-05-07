using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Persons
{
    public class PersonService : IPersonService
    {
        private readonly DataContext _dbContext;

        public PersonService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<Person> AddAsync(Person entity)
        {
            await _dbContext.Persons.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Person>> AddRangeAsync(List<Person> entities)
        {
            await _dbContext.Persons.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Persons.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Persons.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Person> GetAsync(Expression<Func<Person, bool>> expression) => await _dbContext.Persons.SingleOrDefaultAsync(expression);

        public async Task<List<Person>> ListAsync(Expression<Func<Person, bool>> expression) => await _dbContext.Persons.Where(expression).ToListAsync();

        public async Task<List<Person>> ListAsync() => await _dbContext.Persons.Where(person => person.Active).ToListAsync();

        public async Task<bool> UpdateAsync(Person entity)
        {
            try
            {
                var existingData = await _dbContext.Persons.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

                if (existingData == null) return false;

                existingData.FirstName = entity.FirstName;
                existingData.LastName = entity.LastName;
                existingData.MiddleName = entity.MiddleName;
                existingData.BirthDate = entity.BirthDate;
                existingData.ContactNumber = entity.ContactNumber;
                existingData.EmailAddress = entity.EmailAddress;
                existingData.Country = entity.Country;

                _dbContext.Persons.Update(existingData);

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