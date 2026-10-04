# Uberblick Homebrew tap

This repository hosts Homebrew formulae for Uberblick tools.

- **uberblick**: `brew install uberblick-ai/tap/uberblick`. Release automation
  maintains the formula and its public release artifacts; the source repository
  remains private.
- **ub-agents**: `brew install uberblick-ai/tap/ub-agents`. Built from the tagged
  releases of the public [ub-agents](https://github.com/uberblick-ai/ub-agents)
  repository; `brew install --HEAD uberblick-ai/tap/ub-agents` tracks its `main`.
  Includes the terminal view that interactive `ub-agents launch` opens;
  `launch --no-ui` keeps plain output.
