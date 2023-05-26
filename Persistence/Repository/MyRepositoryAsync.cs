using Application.Interfaces;
using Ardalis.Specification.EntityFrameworkCore;
using Persistence.Contexts;

namespace Persistence.Repository
{
    public class MyRepositoryAsync<T> : RepositoryBase<T>, IReadRepositoryAsync<T> where T : class
    {
        private readonly ApplicationDBContext _Dbcontext;
        
        public MyRepositoryAsync(ApplicationDBContext dbcontext) : base(dbcontext)
        {
            _Dbcontext = dbcontext;
        }
    }
}
