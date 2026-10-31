# Breakage log — Withheld

Every breakage found in playtest or build lands here with: what broke, the
evidence, the bloch attempt id, and the fix or the filed finding. Copied to
bloch at the week's close (the log is the input, bloch is the record).

## 2026-10-30 — v1.0 build (sandbox)

- **B-1: cargo blocked by a dead sccache.** The sandbox cargo config
  wraps rustc in sccache backed by a Redis cache; the Redis is not
  running tonight, so every cargo command failed at `sccache rustc
  -vV` before reaching the code. Fix: `RUSTC_WRAPPER=""` on every cargo
  invocation (cargo's own no-cache route), baked into the justfile.
  Filed as an environment finding for the estate: any Rust gate run in
  this sandbox needs the same override until the cache is back.
- **B-2: HUD collision at the D-221 frame check.** The ride-progress
  line and the controls hint overlapped mid-line in the raster font's
  advance ("RIDDEN 3.5…" over "…TO PRESS"). Fix: the hint moved to its
  own row under the ride line; the WALL label nudged clear of the
  gauge. Re-captured, re-inspected PASS.
- **B-3: a test asserted against the latch's bleed.** The trip test
  expected the drive to still be falling ten steps after the latch —
  by then the 25/step bleed had already taken it to the floor. The
  core was right; the test now asserts the real contract: no rise and
  no second trip while latched.
- **B-4 (preflight decision): the macroquad suggestion not taken.**
  The engine-research chapter named macroquad for W11; the program
  contract's uniform seam (draw-list core + JS shell + node capture)
  supersedes it — macroquad renders for itself and would break the
  capture pipeline and the single-file shape the program gates on.
  What the research actually wanted — the law as plain Rust, tiny
  wasm — is what shipped: a zero-dependency cdylib, 47,992 bytes.
- **B-5 (held, not a defect): seahawk playtest pass not run.** Primo
  unreachable tonight (tunnel outage since 03:15 PDT). The sandbox
  automated playtest is the record of the moment; R-905's verify names
  it for this reason.
- **B-6 (held, by design of the jam): GJ-07 live itch checks open.**
  Verified live at entry time; no entry is being submitted tonight.
  R-904 stays open. The game's own 18+ gate ships first regardless.
- **B-7 (design ruling): persistence scope.** What persists (shell
  localStorage): settings, banked petitions, and the book (trips +
  latch seconds + terms ridden). There is no mid-term save; a term is
  one sitting. Recorded here rather than silently narrowing
  R-202/R-203.
- **B-8: menu/end-screen text clipped in the raster (post-tag fix).**
  The estate-wide raster-advance audit (Exposure B-4) flagged 28
  lines here — the gate sub-lines, title subtitle, the whole contract
  page, two captions, and the record lines — all set at sizes whose
  raster advance (which doubles at size >= 21) runs past the edge of
  the rendered surface. The browser's real font fits them; the
  preview videos are the deliverable that clips. Fix: long lines at
  size 19–20, end titles at 44; audit CLEAN on all screens; previews
  re-captured. Fix commit on top of v1.0.0 before any push; the tag
  moves with it.
