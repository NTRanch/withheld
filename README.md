# Withheld

**Nice Thoughts Ranch** · Torogao Jam Program week 11 (Wave C — Mini-games: the Crescendo set) · Yui · **Rust**

Her Governor game — edging as a control-systems game.

An 18+ game built for the weekly Gameotron jam on itch.io (NTRanch), as one
rung of the 14-week Torogao system-validation program (D-333/D-334/D-335/D-336).
The full planning book lives in [`book/`](book/) (mdBook, NTRanch theme);
this repo's bloch roadmap is [`.ai/roadmap.md`](.ai/roadmap.md).

- **Delivery:** one self-contained `index.html` (see `docs` in the book).
- **Cast/art law (D-292):** existing keeper art only; a missing asset is an
  abstract stand-in, logged — never a generation job.
- **Quality bar:** Laplace3D-class animation or the medium's equivalent
  (book chapter: Quality Bar).
- **Audio:** nothing is ever played aloud by an agent; the Owner presses play.

## Play

Open [`web/index.html`](web/index.html) in a browser — it runs fully
offline. Hold the canvas (or hold SPACE) to press her drive up the
gauge; release and it decays. The gold line is the wall: touch it and
the Governor cuts the drive and latches off, and the trip is written
into the book. Win by riding the rose band under the wall for the
contracted seconds before the term — the huge numerals — runs out.

Press **B** to ask. An ask made from low, unlatched, and calm is filed:
the next term gets more time and a wider band. Asks made from the band
or the latch are noise. The wall never moves.

- **Level 1 — First Term:** wall 78, ride 6.0 s inside a 90 s term.
- **Level 2 — Stricter Terms:** wall 84, she shifts (gusts), ride 9.0 s.
- **Level 3 — The Long Term:** wall 90, ride 12.0 s inside 150 s.

Settings (gust reduction, text size), banked petitions, and the book —
every trip, every latch second, every term ridden — persist in the
browser. Settings are reachable before any play.

## Preview videos (rendered from the shipped core, demo mode)

- [Level 1 — First Term](docs/previews/level-1-withheld.mp4)
- [Level 2 — Stricter Terms](docs/previews/level-2-withheld.mp4)
- [Level 3 — The Long Term](docs/previews/level-3-withheld.mp4)

## Build & verify

```sh
just build   # Rust core -> wasm + assemble web/index.html
just check   # fmt, clippy -D warnings, 15 tests, bridges, perf, playtest
just previews
```

Status: **v1.0.0** (2026-10-30) — playable, gated, tagged. The seahawk
playtest pass on primo and the live itch.io entry checks (GJ-07) remain
scheduled follow-ups; both are recorded in `docs/BREAKAGE-LOG.md`.
