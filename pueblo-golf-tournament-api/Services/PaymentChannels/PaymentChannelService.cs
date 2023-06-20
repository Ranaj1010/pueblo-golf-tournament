using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.PaymentChannels
{
    public class PaymentChannelService : IPaymentChannelService
    {
        private readonly DataContext _dbContext;
        public PaymentChannelService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<PaymentChannel> AddAsync(PaymentChannel entity)
        {
            await _dbContext.PaymentChannels.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<PaymentChannel>> AddRangeAsync(List<PaymentChannel> entities)
        {
            await _dbContext.PaymentChannels.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.PaymentChannels.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.PaymentChannels.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<PaymentChannel> GetAsync(Expression<Func<PaymentChannel, bool>> expression) => await _dbContext.PaymentChannels.SingleOrDefaultAsync(expression);

        public async Task<List<PaymentChannel>> ListAsync(Expression<Func<PaymentChannel, bool>> expression) => await _dbContext.PaymentChannels.Where(expression).ToListAsync();

        public async Task<List<PaymentChannel>> ListAsync() => await _dbContext.PaymentChannels.Where(tournament => tournament.Active).ToListAsync();

        public async Task<PaymentChannel> UpdateAsync(PaymentChannel entity)
        {
            var existingData = await _dbContext.PaymentChannels.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.Description= entity.Description;
            existingData.Name = entity.Name;
            existingData.Name = entity.Name;
            _dbContext.PaymentChannels.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;

        }
    }
}