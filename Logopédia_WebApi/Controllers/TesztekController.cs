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
    public class TesztekController : ControllerBase
    {
        private readonly LogopediaContext _context;

        public TesztekController(LogopediaContext context)
        {
            _context = context;
        }

        // GET: api/Tesztek
        [HttpGet]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<IEnumerable<Tesztek>>> Gettesztek()
        {
            return await _context.Tesztek.ToListAsync();
        }

        // GET: api/Tesztek/5
        [HttpGet("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Tesztek>> Gettesztek(int id)
        {
            var tesztek = await _context.Tesztek.FindAsync(id);

            if (tesztek == null)
            {
                return NotFound();
            }

            return tesztek;
        }

        // PUT: api/Tesztek/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Puttesztek(int id, Tesztek tesztek)
        {
            if (id != tesztek.tesztID)
            {
                return BadRequest();
            }

            _context.Entry(tesztek).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TesztekExists(id))
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

        // POST: api/Tesztek
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [Route("tesztKuldese")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Tesztek>> Posttesztek(Tesztek tesztek)
        {
            _context.Tesztek.Add(tesztek);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Gettesztek", new { id = tesztek.tesztID }, tesztek);         
        }

        // DELETE: api/Tesztek/5
        [HttpDelete("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Deletetesztek(int id)
        {
            var tesztek = await _context.Tesztek.FindAsync(id);
            if (tesztek == null)
            {
                return NotFound();
            }

            _context.Tesztek.Remove(tesztek);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TesztekExists(int id)
        {
            return _context.Tesztek.Any(e => e.tesztID == id);
        }
    }
}
