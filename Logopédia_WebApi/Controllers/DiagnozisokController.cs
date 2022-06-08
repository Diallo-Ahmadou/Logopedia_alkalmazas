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

namespace Logopédia_WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("MyCorsImplementationPolicy")]
    public class DiagnozisokController : ControllerBase
    {
        private readonly LogopediaContext _context;

        public DiagnozisokController(LogopediaContext context)
        {
            _context = context;
        }

        private DiagnozisokDTO AsDTO(Diagnozisok diagnozisok)
        {
            if (diagnozisok == null)
            {
                return null;
            }
            return new DiagnozisokDTO(diagnozisok.diagnozis_megnevezese, diagnozisok.gyerekSzam);
        }

        // GET: api/Diagnozisok
        [HttpGet]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<IEnumerable<Diagnozisok>>> Getdiagnozisok()
        {
            return await _context.Diagnozisok.ToListAsync();
        }

        // Gyerekek száma diagnózisok alapján
        // GET: api/Diagnozisok/gyerekSzam_diagnozisokSzerint
        [HttpGet]
        [Route("gyerekSzam_diagnozisokSzerint")]
        [EnableCors("CorsPolicy")]
        public async Task<List<DiagnozisokDTO>> ListDiagnozisok()
        {
            var diagnozisok = await _context.Diagnozisok.Include(x => x.gyerekek).ToListAsync();

            return diagnozisok.Select(x => AsDTO(x)).ToList();
        }

        // PUT: api/Diagnozisok/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Putdiagnozisok(int id, Diagnozisok diagnozisok)
        {
            if (id != diagnozisok.diagnozisID)
            {
                return BadRequest();
            }

            _context.Entry(diagnozisok).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DiagnozisokExists(id))
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

        // POST: api/Diagnozisok
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [EnableCors("CorsPolicy")]
        public async Task<ActionResult<Diagnozisok>> Postdiagnozisok(Diagnozisok diagnozisok)
        {
            _context.Diagnozisok.Add(diagnozisok);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Getdiagnozisok", new { id = diagnozisok.diagnozisID }, diagnozisok);
        }

        // DELETE: api/Diagnozisok/5
        [HttpDelete("{id}")]
        [EnableCors("CorsPolicy")]
        public async Task<IActionResult> Deletediagnozisok(int id)
        {
            var diagnozisok = await _context.Diagnozisok.FindAsync(id);
            if (diagnozisok == null)
            {
                return NotFound();
            }

            _context.Diagnozisok.Remove(diagnozisok);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DiagnozisokExists(int id)
        {
            return _context.Diagnozisok.Any(e => e.diagnozisID == id);
        }
    }
}
