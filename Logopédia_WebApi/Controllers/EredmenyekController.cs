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
    public class EredmenyekController : ControllerBase
    {
        private readonly LogopediaContext _context;

        public EredmenyekController(LogopediaContext context)
        {
            _context = context;
        }

        // GET: api/Eredmenyek
        [HttpGet]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<IEnumerable<Eredmenyek>>> Geteredmenyek()
        {
            return await _context.Eredmenyek.ToListAsync();
        }

        // Gyerekek száma az elmaradás mértéke szerint
        // GET: api/Eredmenyek/elmaradas_merteke/0, 1, 2, 3
        [HttpGet]
        [Route("elmaradas_merteke/{szam}")]
        [EnableCors("CorsPolicy")]
        public int Get(int szam)
        {

            var nincsElmaradas = _context.Eredmenyek.Where(x => x.elmaradas_merteke == 0).Count();
            var egyElmaradas = _context.Eredmenyek.Where(x => x.elmaradas_merteke == 1).Count();
            var kettőElmaradas = _context.Eredmenyek.Where(x => x.elmaradas_merteke == 2).Count();
            var háromElmaradas = _context.Eredmenyek.Where(x => x.elmaradas_merteke == 3).Count();

            switch (szam)
            {
                case 0:
                    szam = nincsElmaradas;
                    break;
                case 1:
                    szam = egyElmaradas;
                    break;
                case 2:
                    szam = kettőElmaradas;
                    break;
                case 3:
                    szam = háromElmaradas;
                    break;
                default:
                    break;
            }

            return szam;
        }

        // Kitöltött tesztek
        // GET: api/Eredmenyek/tesztkitoltokSzama
        [HttpGet]
        [Route("tesztkitoltokSzama")]
        [EnableCors("CorsPolicy")]
        public ActionResult GetKitöltőkSzáma()
        {
            var kitöltőkSzáma = _context.Tesztek.Select(x => x.tesztID).Count();

            return Ok(kitöltőkSzáma);
        }

        // GET: api/Eredmenyek/5
        [HttpGet("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Eredmenyek>> Geteredmenyek(int id)
        {
            var eredmenyek = await _context.Eredmenyek.FindAsync(id);

            if (eredmenyek == null)
            {
                return NotFound();
            }

            return eredmenyek;
        }

        // PUT: api/Eredmenyek/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Puteredmenyek(int id, Eredmenyek eredmenyek)
        {
            if (id != eredmenyek.tesztID)
            {
                return BadRequest();
            }

            _context.Entry(eredmenyek).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EredmenyekExists(id))
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

        // POST: api/Eredmenyek
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Eredmenyek>> Posteredmenyek(Eredmenyek eredmenyek)
        {
            _context.Eredmenyek.Add(eredmenyek);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (!EredmenyekExists(eredmenyek.tesztID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("Geteredmenyek", new { id = eredmenyek.tesztID }, eredmenyek);
        }

        // DELETE: api/Eredmenyek/5
        [HttpDelete("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Deleteeredmenyek(int id)
        {
            var eredmenyek = await _context.Eredmenyek.FindAsync(id);
            if (eredmenyek == null)
            {
                return NotFound();
            }

            _context.Eredmenyek.Remove(eredmenyek);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool EredmenyekExists(int id)
        {
            return _context.Eredmenyek.Any(e => e.tesztID == id);
        }
    }
}
