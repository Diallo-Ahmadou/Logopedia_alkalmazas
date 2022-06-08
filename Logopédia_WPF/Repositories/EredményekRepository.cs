using Logopédia_WPF.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Logopédia_WPF.Repositories
{
    public class EredményekRepository : GenericRepository<Eredmenyek, LogopediaContext>
    {
        public EredményekRepository(LogopediaContext context) : base(context)
        {
        }

        public List<Eredmenyek> GetAll(string search = null)
        {
            var query = _context.Eredmenyek.Include(x => x.oktatasi_azonositoNavigation).Include(x => x.terapiaIDNavigation).Include(x => x.tesztIDNavigation).AsQueryable();

            return query.ToList();
        }
    }
}
