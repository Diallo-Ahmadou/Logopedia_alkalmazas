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
    public class GyerekekController : ControllerBase
    {
        private readonly LogopediaContext _context;

        public GyerekekController(LogopediaContext context)
        {
            _context = context;
        }

        // GET: api/Gyerekek
        [HttpGet]
        [EnableCors("CorsPolicy")]
        //[Route("Gyerekek")]
        public async Task<ActionResult<IEnumerable<Gyerekek>>> Getgyerekek()
        {
            return await _context.Gyerekek.ToListAsync();
        }

        // Gyerekek számának lekérése
        // GET: api/Gyerekek/gyerekekSzama
        [HttpGet]
        [Route("gyerekekSzama")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<int>> Count()
        {
            
            return await  _context.Gyerekek.CountAsync();
        }

        // egy oviban hány gyerek töltötte ki a tesztet
        // GET: api/Gyerekek/gyerekekSzama/tesztkitolto_gyerekek
        [HttpGet]
        [Route("tesztkitolto_gyerekek")]
        [EnableCors("CorsPolicy")]
        public ActionResult GetGyerekekSzáma()
        {           
            var ovodakNeve = _context.Ovodak.Select(x => x.ovoda_neve).Distinct().ToList();
            var gyerekekSzáma = _context.Gyerekek.GroupBy(x => x.ovodaIDNavigation.ovoda_neve).Distinct().ToList();
            
            return Ok(gyerekekSzáma);
        }

        // GET: api/Gyerekek/5
        [HttpGet("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Gyerekek>> Getgyerekek(string id)
        {
            var gyerekek = await _context.Gyerekek.FindAsync(id);

            if (gyerekek == null)
            {
                return NotFound();
            }

            return gyerekek;
        }

        // PUT: api/Gyerekek/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Putgyerekek(string id, Gyerekek gyerekek)
        {
            if (id != gyerekek.oktatasi_azonosito)
            {
                return BadRequest();
            }

            _context.Entry(gyerekek).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!GyerekekExists(id))
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

        // POST: api/Gyerekek
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Gyerekek>> Postgyerekek(Gyerekek gyerekek)
        {
            _context.Gyerekek.Add(gyerekek);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (GyerekekExists(gyerekek.oktatasi_azonosito))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("Getgyerekek", new { id = gyerekek.oktatasi_azonosito }, gyerekek);
        }

        // DELETE: api/Gyerekek/5
        [HttpDelete("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Deletegyerekek(string id)
        {
            var gyerekek = await _context.Gyerekek.FindAsync(id);
            if (gyerekek == null)
            {
                return NotFound();
            }

            _context.Gyerekek.Remove(gyerekek);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool GyerekekExists(string id)
        {
            return _context.Gyerekek.Any(e => e.oktatasi_azonosito == id);
        }
    }
}
