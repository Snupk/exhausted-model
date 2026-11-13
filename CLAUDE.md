# CLAUDE.md

Exhausted Model: native Swift macOS menu bar app tracking Claude Code usage. Code lives in `swift/` (SwiftPM, no dependencies). Originally forked from CCSeva; we no longer track upstream.

## Workflow for every change

1. Bump `VERSION` (semver: fix → patch, feature/visible change → minor).
2. Add an entry to `CHANGELOG.md` under the new version.
3. Rebuild and relaunch: `pkill -x ExhaustedModel; cd swift && ./scripts/build-app.sh && open dist/ExhaustedModel.app`.
4. Commit and push to `origin main`.
5. For a release: tag `vX.Y.Z` and push the tag (the Release workflow builds the zip/dmg), then update `version` and `sha256` in `~/homebrew-tap/Casks/exhausted-model.rb` (repo Snupk/homebrew-tap) and push it.

## Commands

```sh
cd swift
swift build                 # debug build
swift test                  # unit tests
./scripts/build-app.sh      # release .app → dist/ExhaustedModel.app (ad-hoc signed, version from ../VERSION)
.build/debug/ExhaustedModel --diagnose   # headless check of scanning and limits
```

## Layout

- `swift/Sources/ExhaustedModel/App`: `AppDelegate` (status item, popover)
- `Data`: JSONL scanning, aggregation, `UsageStore` (app state)
- `Limits`: Claude OAuth token from Keychain + `api.anthropic.com/api/oauth/usage`
- `Directory`: optional claudecode.directory sync (opt-in)
- `Support`: settings (`~/.exhausted-model/settings.json`), notifications, launch at login
- `UI`: SwiftUI tabs and `Theme.swift` (colors, Fira Code)

Details: `swift/README.md`.

## Conventions

- Muted text uses `Color.textTertiary` (#948D88); keep text at WCAG AA contrast (≥4.5:1) on the dark background.
- The user is a designer, not a developer: explain changes in plain language.
