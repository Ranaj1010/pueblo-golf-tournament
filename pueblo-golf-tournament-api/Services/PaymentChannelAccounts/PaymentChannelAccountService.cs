using System.Linq.Expressions;
using System.Threading.Channels;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Services.PaymentChannelAccounts
{
    public class PaymentChannelAccountService : IPaymentChannelAccountService
    {
        private readonly DataContext _dbContext;
        public PaymentChannelAccountService(DataContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<PaymentChannelAccount> AddAsync(PaymentChannelAccount entity)
        {
            await _dbContext.PaymentChannelAccounts.AddAsync(entity);
            await _dbContext.SaveChangesAsync();
            return entity;
        }

        public async Task<List<PaymentChannelAccount>> AddRangeAsync(List<PaymentChannelAccount> entities)
        {
            await _dbContext.PaymentChannelAccounts.AddRangeAsync(entities);
            await _dbContext.SaveChangesAsync();
            return entities;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var existingData = await _dbContext.PaymentChannelAccounts.SingleOrDefaultAsync(result => result.Id.Equals(id));

                if (existingData == null) return false;

                existingData.Active = false;

                _dbContext.PaymentChannelAccounts.Update(existingData);

                await _dbContext.SaveChangesAsync();

                return true;
            }
            catch (System.Exception)
            {
                return false;
            }
        }

        public async Task<PaymentChannelAccount> GetAsync(Expression<Func<PaymentChannelAccount, bool>> expression) => await _dbContext.PaymentChannelAccounts.Join(_dbContext.PaymentChannels, account => account.PaymentChannelId, channel => channel.Id, (account, channel) => new PaymentChannelAccount
        {
            PaymentChannelId = channel.Id,
            AccountName = account.AccountName,
            AccountNumber = account.AccountNumber,
            Active = account.Active,
            ArchivedAt = account.ArchivedAt,
            CreatedAt = account.CreatedAt,
            Id = account.Id,
            PaymentChannel = channel,
            TournamentId = account.TournamentId,
        }).SingleOrDefaultAsync(expression);
        public async Task<List<PaymentChannelAccount>> ListAsync(Expression<Func<PaymentChannelAccount, bool>> expression) => await _dbContext.PaymentChannelAccounts.Where(expression).Join(_dbContext.PaymentChannels, account => account.PaymentChannelId, channel => channel.Id, (account, channel) => new PaymentChannelAccount
        {
            PaymentChannelId = channel.Id,
            AccountName = account.AccountName,
            AccountNumber = account.AccountNumber,
            Active = account.Active,
            ArchivedAt = account.ArchivedAt,
            CreatedAt = account.CreatedAt,
            Id = account.Id,
            PaymentChannel = channel,
            TournamentId = account.TournamentId,
        }).ToListAsync();
        public async Task<List<PaymentChannelAccount>> ListAsync() => await _dbContext.PaymentChannelAccounts.Where(tournament => tournament.Active).Join(_dbContext.PaymentChannels, account => account.PaymentChannelId, channel => channel.Id, (account, channel) => new PaymentChannelAccount
        {
            PaymentChannelId = channel.Id,
            AccountName = account.AccountName,
            AccountNumber = account.AccountNumber,
            Active = account.Active,
            ArchivedAt = account.ArchivedAt,
            CreatedAt = account.CreatedAt,
            Id = account.Id,
            PaymentChannel = channel,
            TournamentId = account.TournamentId,
        }).ToListAsync();
        public async Task<PaymentChannelAccount> UpdateAsync(PaymentChannelAccount entity)
        {
            var existingData = await _dbContext.PaymentChannelAccounts.SingleOrDefaultAsync(result => result.Id.Equals(entity.Id));

            if (existingData == null) return null;

            existingData.AccountName = entity.AccountName;
            existingData.AccountNumber = entity.AccountNumber;
            existingData.TournamentId = entity.TournamentId;
            _dbContext.PaymentChannelAccounts.Update(existingData);

            await _dbContext.SaveChangesAsync();

            return entity;
        }
    }
}