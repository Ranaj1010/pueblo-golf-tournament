using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.Payments
{
    public class PaymentService : IPaymentService
    {

        private readonly DataContext _dbContext;
        public PaymentService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<Payment> AddAsync(Payment entity)
        {
            await _dbContext.Payments.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<Payment>> AddRangeAsync(List<Payment> entities)
        {
            await _dbContext.Payments.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.Payments.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.Payments.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<Payment> GetAsync(Expression<Func<Payment, bool>> expression)=> await _dbContext.Payments.SingleOrDefaultAsync(expression);

        public async Task<List<Payment>> ListAsync(Expression<Func<Payment, bool>> expression) => await _dbContext.Payments.Where(expression).ToListAsync();
      
        public async Task<List<Payment>> ListAsync() => await _dbContext.Payments.Where(tournament => tournament.Active).ToListAsync();
        public async Task<bool> UpdateAsync(Payment entity)
        {
            try
            {
                var existingData = await _dbContext.Payments.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

                if (existingData == null) return false;

                existingData.ReferrenceId = entity.ReferrenceId;
                existingData.PaymentMethod = entity.PaymentMethod;
                existingData.PaymentReferrencePhoto = entity.PaymentReferrencePhoto;

                _dbContext.Payments.Update(existingData);

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