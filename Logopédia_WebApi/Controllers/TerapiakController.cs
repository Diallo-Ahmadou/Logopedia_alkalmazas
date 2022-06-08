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
    public class TerapiakController : ControllerBase
    {
        private readonly LogopediaContext _context;

        public TerapiakController(LogopediaContext context)
        {
            _context = context;
        }

        // GET: api/Terapiak
        [HttpGet]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<IEnumerable<Terapiak>>> Getterapiak()
        {
            return await _context.Terapiak.ToListAsync();
        }

        // Hány gyereknél van szükség terápiára
        // GET: api/Terapiak/szukseges
        [HttpGet]
        [Route("szukseges")]
        [EnableCors("CorsPolicy")]
        public int Get()
        {
            var dbSzám = _context.Terapiak.Where(x => Convert.ToInt32(x.szukseges_e) == 1).Count();

            return dbSzám ;
        }

        // Összesen hány terápia
        // GET: api/Terapiak/osszes
        [HttpGet]
        [Route("osszes")]
        [EnableCors("CorsPolicy")]
        public int Count()
        {
            var terápiák = _context.Terapiak.ToList(); //.GroupBy(x => x.terapia_taneve);
            var összesTerápia = terápiák.Count;

            return összesTerápia;
        }

        // Hány szakember végzi őket
        // GET: api/Terapiak/szakemberekSzama
        [HttpGet]
        [Route("szakemberekSzama")]
        [EnableCors("CorsPolicy")]
        public int CountSzakemberek()
        {
            var szakemberekSzáma = _context.Terapiak.Where(x => Convert.ToInt32(x.szukseges_e) != 0).Select(x => x.ellato_szakemberID).Distinct().Count();

            return szakemberekSzáma;
        }

        // GET: api/Terapiak/5
        [HttpGet("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Terapiak>> Getterapiak(int id)
        {
            var terapiak = await _context.Terapiak.FindAsync(id);

            if (terapiak == null)
            {
                return NotFound();
            }

            return terapiak;
        }

        // PUT: api/Terapiak/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Putterapiak(int id, Terapiak terapiak)
        {
            if (id != terapiak.terapiaID)
            {
                return BadRequest();
            }

            _context.Entry(terapiak).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TerapiakExists(id))
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

        // POST: api/Terapiak
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Terapiak>> Postterapiak(Terapiak terapiak)
        {
            _context.Terapiak.Add(terapiak);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Getterapiak", new { id = terapiak.terapiaID }, terapiak);
        }

        // DELETE: api/Terapiak/5
        [HttpDelete("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Deleteterapiak(int id)
        {
            var terapiak = await _context.Terapiak.FindAsync(id);
            if (terapiak == null)
            {
                return NotFound();
            }

            _context.Terapiak.Remove(terapiak);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TerapiakExists(int id)
        {
            return _context.Terapiak.Any(e => e.terapiaID == id);
        }
    }
}
