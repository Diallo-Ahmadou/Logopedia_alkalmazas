using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Logopédia_WebApi.Models;
using Microsoft.AspNetCore.Cors;

namespace Logopédia_WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("MyCorsImplementationPolicy")]
    public class SzakemberekController : ControllerBase
    {
        private readonly LogopediaContext _context;

        public SzakemberekController(LogopediaContext context)
        {
            _context = context;
        }

        // GET: api/Szakemberek
        [HttpGet]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<IEnumerable<Szakemberek>>> Getszakemberek()
        {
            return await _context.Szakemberek.ToListAsync();
        }

        // GET: api/Szakemberek/5
        [HttpGet("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Szakemberek>> Getszakemberek(int id)
        {
            var szakemberek = await _context.Szakemberek.FindAsync(id);

            if (szakemberek == null)
            {
                return NotFound();
            }

            return szakemberek;
        }

        // PUT: api/Szakemberek/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Putszakemberek(int id, Szakemberek szakemberek)
        {
            if (id != szakemberek.ellato_szakemberID)
            {
                return BadRequest();
            }

            _context.Entry(szakemberek).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SzakemberekExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Szakemberek
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Szakemberek>> Postszakemberek(Szakemberek szakemberek)
        {
            _context.Szakemberek.Add(szakemberek);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Getszakemberek", new { id = szakemberek.ellato_szakemberID }, szakemberek);
        }

        // DELETE: api/Szakemberek/5
        [HttpDelete("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Deleteszakemberek(int id)
        {
            var szakemberek = await _context.Szakemberek.FindAsync(id);
            if (szakemberek == null)
            {
                return NotFound();
            }

            _context.Szakemberek.Remove(szakemberek);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SzakemberekExists(int id)
        {
            return _context.Szakemberek.Any(e => e.ellato_szakemberID == id);
        }
    }
}
