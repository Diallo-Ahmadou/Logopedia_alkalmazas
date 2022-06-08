﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logopédia_WPF.Repositories
{
    public interface IGenericRepository<T> where T : class
    {
        List<T> GetAll();
        T Get(int? id);
        void Insert(T entity);
        void Update(T entity);
        void Delete(int? id);
    }
}
