# Exhausted Model

A native macOS menu bar app that shows how much of your Claude Code limit is left, so you know before the model is exhausted.

## Install

Paste into Terminal (Apple Silicon, macOS 14+):

```sh
brew install --cask snupk/tap/exhausted-model
```

Update later with `brew upgrade --cask exhausted-model`.

## Screenshots

![Dashboard](./screenshots/dashboard.png)
![Analytics](./screenshots/analytics.png)
![Terminal](./screenshots/terminal.png)

## Features

- **Live menu bar usage**: percentage in the menu bar with color-coded status
- **Real limit gauges**: 5-hour and weekly utilization from Claude Code's usage endpoint (includes usage from other devices), with reset countdowns and a predicted cutoff time; falls back to local estimates when the endpoint is unavailable
- **5-hour blocks**: tokens, burn rate, projection and reset countdown for the current window
- **Weekly history**: week-by-week token and cost rollups
- **Per-model and per-project breakdown**: see where your tokens go
- **Notifications** at 70% and 90%, only when the status gets worse
- **Launch at login**, optional
- ~3 MB, no Electron, no Node, no runtime dependencies

## Usage

1. Exhausted Model appears in the menu bar with your current usage percentage.
2. **Left-click** opens the Dashboard, Live, Analytics, Terminal and Settings tabs.
3. **Right-click** shows Refresh and Quit.

The app reads Claude Code transcripts from `~/.claude/projects` and refreshes when they change.

## Privacy

- Transcripts are parsed locally; their content never leaves your Mac.
- Your Claude Code token (from Keychain) is sent only to `api.anthropic.com` to read your limits, the same way Claude Code does.
- **Optional** sync with [claudecode.directory](https://claudecode.directory): off until you press *Connect with GitHub* in Settings. It uploads daily per-model totals (tokens, estimated cost, date, timezone, model) and never prompts, responses, project names, paths or credentials.

## Build from source

Requires Xcode 16.4 / Swift 6.1 and macOS 14+.

```sh
git clone https://github.com/Snupk/exhausted-model.git
cd exhausted-model/swift
./scripts/build-app.sh
open dist/ExhaustedModel.app
```

Architecture and data pipeline: [`swift/README.md`](swift/README.md). Changes: [`CHANGELOG.md`](CHANGELOG.md).

## Credits

Started as a fork of [CCSeva](https://github.com/Iamshankhadeep/ccseva) by [@Iamshankhadeep](https://github.com/Iamshankhadeep). Usage data format and 5-hour block algorithm follow [ccusage](https://github.com/ryoppippi/ccusage).

## License

MIT, see [LICENSE](LICENSE).

---

Unofficial tool, not affiliated with Anthropic. Requires Claude Code.
