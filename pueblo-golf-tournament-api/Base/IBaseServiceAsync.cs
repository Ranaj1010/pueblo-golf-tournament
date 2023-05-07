using System.Linq.Expressions;

namespace pueblo_golf_tournament_api.Base
{
    public interface IBaseServiceAsync<T> where T : BaseEntity
    {
        Task<T> AddAsync(T entity);
        Task<List<T>> AddRangeAsync(List<T> entities);
        Task<bool> UpdateAsync(T entity);
        Task<bool> DeleteAsync(long id);
        Task<T> GetAsync(Expression<Func<T, bool>> expression);
        Task<List<T>> ListAsync(Expression<Func<T, bool>> expression);
        Task<List<T>> ListAsync();
    }
}