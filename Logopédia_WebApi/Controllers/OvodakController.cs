using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Logopédia_WebApi.Models;
using Microsoft.AspNetCore.Cors;
using Logopédia_WebApi.DTOs;
using System.Linq.Expressions;

namespace Logopédia_WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("MyCorsImplementationPolicy")]
    public class OvodakController : ControllerBase
    {
        private readonly LogopediaContext _context;

        public OvodakController(LogopediaContext context)
        {
            _context = context;
        }

        private OvodakDTO AsDTO(Ovodak ovodak)
        {
            if (ovodak == null)
            {
                return null;
            }
            return new OvodakDTO(ovodak.ovoda_neve, ovodak.letszam);
        }

        // GET: api/Ovodak
        [HttpGet]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<IEnumerable<Ovodak>>> Getovodak()
        {
            return await _context.Ovodak.ToListAsync();
        }

        // Gyerekek száma óvodák szerint
        // GET: api/Ovodak/gyerekEloszlas
        [HttpGet]
        [Route("gyerekEloszlas")]
        [EnableCors("CorsPolicy")]
        public async Task<List<OvodakDTO>> GyerekekSzáma()
        {
            var ovodak = await _context.Ovodak.Include(x => x.gyerekek).ToListAsync();

            return ovodak.Select(x => AsDTO(x)).ToList();
        }

        // GET: api/Ovodak/5
        [HttpGet("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Ovodak>> Getovodak(int id)
        {
            var ovodak = await _context.Ovodak.FindAsync(id);

            if (ovodak == null)
            {
                return NotFound();
            }

            return ovodak;
        }

        // PUT: api/Ovodak/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Putovodak(int id, Ovodak ovodak)
        {
            if (id != ovodak.ovodaID)
            {
                return BadRequest();
            }

            _context.Entry(ovodak).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OvodakExists(id))
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

        // POST: api/Ovodak
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Ovodak>> Postovodak(Ovodak ovodak)
        {
            _context.Ovodak.Add(ovodak);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Getovodak", new { id = ovodak.ovodaID }, ovodak);
        }

        // DELETE: api/Ovodak/5
        [HttpDelete("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Deleteovodak(int id)
        {
            var ovodak = await _context.Ovodak.FindAsync(id);
            if (ovodak == null)
            {
                return NotFound();
            }

            _context.Ovodak.Remove(ovodak);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OvodakExists(int id)
        {
            return _context.Ovodak.Any(e => e.ovodaID == id);
        }
    }
}
