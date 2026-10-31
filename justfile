# Withheld — task recipes (wired at the v1.0 build, 2026-10-30).
# Rust pin nightly-2026-09-25 (rust-toolchain.toml); cargo lives at
# ~/.cargo/bin in the sandbox. RUSTC_WRAPPER is emptied on purpose: the
# sandbox's sccache is backed by a Redis that is not running tonight
# (breakage B-1); an empty wrapper is cargo's own no-cache route.

CARGO := env_var_or_default("CARGO", join(home_dir(), ".cargo/bin/cargo"))

# Assemble the single-file jam entry: Rust core -> wasm, inlined
build:
    RUSTC_WRAPPER="" {{CARGO}} build --release --target wasm32-unknown-unknown
    node tools/assemble.mjs

# Run every gate: format, clippy (strict), core tests, bridges, perf, playtest
check:
    {{CARGO}} fmt --check
    RUSTC_WRAPPER="" {{CARGO}} clippy --all-targets -- -D warnings
    RUSTC_WRAPPER="" {{CARGO}} test
    RUSTC_WRAPPER="" {{CARGO}} build --release --target wasm32-unknown-unknown
    node tools/assemble.mjs
    node tools/settings-check.mjs
    node tools/perf.mjs
    node tools/playtest.mjs

# Render the per-level preview videos from the shipped core (demo mode)
previews:
    node tools/capture.mjs 0 20263
    node tools/capture.mjs 1 20263
    node tools/capture.mjs 2 20263

# Build the planning book
book:
    mdbook build book
