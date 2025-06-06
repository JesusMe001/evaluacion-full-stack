﻿using ProductService.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ProductService.Services
{
    public interface IProductService
    {
        Task<IEnumerable<Product>> GetAllAsync(string? category = null);
        Task<Product?> GetByIdAsync(int id);
        Task<Product> CreateAsync(Product product);
        Task<Product?> UpdateAsync(Product product);
        Task<bool> DeleteAsync(int id);
    }
}

