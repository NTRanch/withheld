# Changelog — Withheld

All notable changes, newest first. Format: Keep a Changelog.

## [1.0.0] — 2026-10-30

First playable release: the full W11 mechanism group, built and gated in
the sandbox under the Owner's v1.0 jam directive.

- **The Governor core** (Rust, wasm32, zero dependencies): drive rises
  under held stimulus and decays on release; a fixed threshold — the
  wall — trips a latch that cuts the drive and locks stimulus out.
  Winning is riding the band under the wall for the contracted time.
- **Three session contracts**: First Term (wall 78, ride 6 s in 90 s),
  Stricter Terms (wall 84, gusts, ride 9 s in 120 s), The Long Term
  (wall 90, ride 12 s in 150 s).
- **The begging register**: B files an ask; well-formed asks (from low,
  unlatched, off cooldown) bank petitions worth +8 s and a wider band
  for the NEXT term. The wall never moves.
- **Denial bookkeeping**: every trip and latch second is written into
  the book, persisted by the shell across sessions.
- **Countdown, Counted Down**: the term as huge central numerals.
- **Screens**: 18+ gate, title with term picker, the contract,
  gameplay, pause, settings (gust reduction, text size), victory,
  game over.
- **Audio**: generated WebAudio cues answering player input only.
- **Previews**: `docs/previews/level-{1,2,3}-withheld.mp4`, rendered
  from the shipped core in demo mode.
- **Gates**: 15 core tests (validation + adversarial), clippy
  `-D warnings` + rustfmt clean (clippy 0.1.100), settings/petition
  bridge checks, performance budget (0.024 ms/step, 48 KB wasm),
  scripted playtest riding all three terms with zero trips.

## [0.1.0] — 2026-10-30

- Repo scaffolded 2026-10-30: bloch roadmap (kind=game, lane=restricted),
  planning, per-game skill, baseline Rust config, NTRanch-themed mdBook,
  brand assets (header + icon).
