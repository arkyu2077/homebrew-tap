# Homebrew Tap for VideoUpscaler (`arkyu2077/tap`)

[![Homepage](https://img.shields.io/badge/Homepage-videoupscaler.co-blue)](https://videoupscaler.co)
[![CLI Source](https://img.shields.io/badge/GitHub-videoupscaler--cli-black)](https://github.com/arkyu2077/videoupscaler-cli)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](./LICENSE)

Official [Homebrew](https://brew.sh) tap for **[VideoUpscaler](https://videoupscaler.co)** — the cloud AI video enhancement platform and command-line interface for upscaling videos to **1080p Full HD, 2K QHD, and 4K UHD** with temporal AI super-resolution.

Whether you need a studio-grade [4K video upscaler](https://videoupscaler.co/4k-video-upscaler) on macOS or Linux, an automated [batch video upscaler](https://videoupscaler.co/batch-video-upscaler) for production pipelines, or specialized restoration tools to [denoise video](https://videoupscaler.co/denoise-video), run [AI frame interpolation](https://videoupscaler.co/frame-interpolation) (60fps/120fps), and [stabilize video](https://videoupscaler.co/stabilize-video), installing `videoupscaler` via Homebrew gives you a fast, zero-dependency CLI backed by the [VideoUpscaler REST API](https://videoupscaler.co/docs).

---

## Quick Install

Install `videoupscaler` on macOS (Apple Silicon & Intel) or Linux via Homebrew:

```bash
brew tap arkyu2077/tap && brew install videoupscaler
```

Or install in a single command:

```bash
brew install arkyu2077/tap/videoupscaler
```

Verify the installation:

```bash
videoupscaler --version
videoupscaler --help
```

---

## Authentication

1. Sign in at **[videoupscaler.co](https://videoupscaler.co)** and create an API key under **Settings → API Keys** (`vu_live_...`).
2. Export `VIDEOUPSCALER_API_KEY` in your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
export VIDEOUPSCALER_API_KEY="vu_live_your_api_key_here"
```

---

## Usage Examples

### 1. Check Account Balance & Per-Second Credit Rates

```bash
videoupscaler account
```

### 2. Upscale a Local Video File to 4K UHD

Upload a local `.mp4`, `.mov`, or `.webm` clip, upscale it with the [4K video upscaler](https://videoupscaler.co/4k-video-upscaler), poll until completion, and save the result locally:

```bash
videoupscaler upscale ./input-clip.mp4 --resolution 4k --wait --out ./output-4k.mp4
```

### 3. Upscale a Remote Cloud Storage URL (S3 / Cloudflare R2 / GCS)

Pass any public or pre-signed `https://` URL directly without downloading it first:

```bash
videoupscaler upscale "https://cdn.example.com/raw-footage.mp4" \
  --resolution 2k \
  --wait \
  --out ./master-2k.mp4
```

### 4. Batch Video Upscaling from a Shell Loop

Combine `videoupscaler` with standard Unix tools or our [batch video upscaler](https://videoupscaler.co/batch-video-upscaler) for multi-file directory processing:

```bash
for clip in ./raw/*.mp4; do
  base="$(basename "$clip" .mp4)"
  videoupscaler upscale "$clip" --resolution 4k --wait --out "./upscaled/${base}-4k.mp4"
done
```

### 5. Inspect Task Status & History

```bash
# List recent tasks (JSON output for jq / CI scripts)
videoupscaler tasks --limit 10 --json

# Check or wait on a specific task ID
videoupscaler task task_01JXYZ... --wait --out ./completed.mp4
```

---

## Available Formulae

| Formula | Description | Source Repository |
| :--- | :--- | :--- |
| [`videoupscaler`](./Formula/videoupscaler.rb) | Official CLI for [VideoUpscaler](https://videoupscaler.co) — AI video upscaling to 1080p, 2K, and 4K | [`arkyu2077/videoupscaler-cli`](https://github.com/arkyu2077/videoupscaler-cli) |

---

## VideoUpscaler Platform & Ecosystem

Explore the complete suite of AI video restoration tools, developer SDKs, and workflow integrations:

- **[VideoUpscaler Web Studio](https://videoupscaler.co)** — Browser-based and API-driven AI video super-resolution.
- **[4K Video Upscaler](https://videoupscaler.co/4k-video-upscaler)** — Upgrade 480p/720p/1080p footage to razor-sharp 4K UHD (3840×2160) with temporal consistency.
- **[Batch Video Upscaler](https://videoupscaler.co/batch-video-upscaler)** — Process entire folders and media catalogs in parallel.
- **[AI Video Denoiser](https://videoupscaler.co/denoise-video)** — Remove high-ISO sensor grain, low-light noise, and H.264/H.265 compression blocks.
- **[AI Frame Interpolation](https://videoupscaler.co/frame-interpolation)** — Boost 24fps/30fps video to silky-smooth 60fps or 120fps slow-motion using optical-flow AI.
- **[AI Video Stabilizer](https://videoupscaler.co/stabilize-video)** — Eliminate handheld jitter, rolling shutter distortion, and drone vibrations.
- **[Workflow Integrations Hub](https://videoupscaler.co/integrations)** — Ready-to-use blueprints for n8n, Make.com, Zapier, GitHub Actions, and cloud storage triggers.
- **[Workflow Automation Docs](https://videoupscaler.co/docs/workflows)** — Technical guides for idempotent job submission, webhook/polling patterns, and S3/R2 pipelines.
- **[`arkyu2077/videoupscaler-cli`](https://github.com/arkyu2077/videoupscaler-cli)** — Upstream CLI source code, Python SDK (`pip install videoupscaler`), npm package (`npm i -g videoupscaler`), and Docker container.

---

## Updating & Uninstalling

```bash
# Upgrade to the latest release
brew update && brew upgrade videoupscaler

# Uninstall
brew uninstall videoupscaler
brew untap arkyu2077/tap
```

## License

MIT License — see [LICENSE](./LICENSE).
