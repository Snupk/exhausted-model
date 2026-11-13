# Changelog

All notable changes to Exhausted Model.

## Unreleased

- Removed the legacy Electron/TypeScript app; the repository is Swift-only now.
- New README with Homebrew install; CI and issue templates no longer mention Node.
- Homebrew install line includes `brew trust`, required by Homebrew 7+.

## 2.2.0 — 2026-11-13

- The popover arrow now matches the dark window instead of showing up white.
- The menu bar shows the percentage by default (was alternating with cost).
- Muted labels are lighter (`#948D88`) so they pass WCAG AA contrast on the dark background.

## 2.1.0 — 2026-11-13

First Exhausted Model release, forked from CCSeva 2.0.2.

- Renamed the app to Exhausted Model: menu bar, windows, notifications, bundle id `com.snupk.exhaustedmodel`.
- Settings now live in `~/.exhausted-model/` (CCSeva's `~/.ccseva/` is not read).
- Notifications pass text to `osascript` as arguments instead of escaping it into the script.
- Version now comes from the `VERSION` file.
