# Noggin — Brain Arcade

A single-file cognitive training game built as a YouTube Playable. 12 brain-training mini-games, a deterministic Daily Challenge, and a Practice mode — all rendered on an HTML5 Canvas with synthesized WebAudio. Zero dependencies, zero build step, no external assets.

## Play

Open `synapse.html` in any modern browser. That's it.

For local dev (so the page isn't served from `file://`):

```bash
python3 -m http.server 8765
# then visit http://localhost:8765/synapse.html
```

## What's in it

**Two modes:**
- **Daily Challenge** — 5 rounds, same games for everyone on a given day (seeded), build a streak, earn a rank (D→S).
- **Practice** — pick any game and train it; per-game best scores are tracked.

**12 mini-games**, each targeting a cognitive domain:

| Game | Domain | Mechanic |
|------|--------|----------|
| Math Rush | speed | Solve arithmetic against the clock |
| Color Clash | speed | Stroop-style word/color interference |
| Reflex | speed | Tap the moment the signal fires |
| Recall | memory | Memorize lit cells, repeat the pattern |
| Sequence | memory | Repeat lengthening symbol chains |
| N-Back | memory | Does the current item match N steps ago? |
| Speed Match | attention | Does this symbol match the previous? |
| Pattern Logic | reasoning | Complete the 3×3 visual pattern |
| Visual Search | attention | Find all target shapes among distractors |
| Trail | executive | Connect nodes in order under time pressure |
| Word Web | language | Pick the words that belong to a category |
| Spin Code | reasoning | Decode the symbol→digit key |

## Architecture notes

- **Single file** (`synapse.html`, ~3,000 lines) — required for the YouTube Playable deployment target.
- **No dependencies** — pure vanilla JS, Canvas 2D, and WebAudio synthesis.
- **Persistence** — `localStorage` with an in-memory fallback (`Store` object) for sandboxed environments.
- **Deterministic dailies** — seeded RNG (`mulberry32`) so every player gets the same challenge each day.
- **Input** — full touch and keyboard support (digits for options, `Y`/`N` for yes/no games, `P`/`Esc` to pause, `Space`/`Enter` to confirm).
- **Self-contained rendering** — shared `panel()`, `text()`, particle FX, and press-feedback helpers keep the visual language consistent across games.

## Tech stack

HTML5 Canvas · vanilla JavaScript · WebAudio API · `localStorage`
