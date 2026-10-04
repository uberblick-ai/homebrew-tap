# Uberblick Homebrew tap

This repository hosts Homebrew formulae for Uberblick tools.

- **uberblick**: `brew install uberblick-ai/tap/uberblick`. Release automation
  maintains the formula and its public release artifacts; the source repository
  remains private.
- **ub-agents**: `brew install uberblick-ai/tap/ub-agents`. Built from the tagged
  releases of the public [ub-agents](https://github.com/uberblick-ai/ub-agents)
  repository; `brew install --HEAD uberblick-ai/tap/ub-agents` tracks its `main`.

- **ub-agents-ui**: `brew install uberblick-ai/tap/ub-agents-ui`. Optional read-only
  local terminal view in its own Python environment, with pinned resources. The
  base `ub-agents` package stays UI-free. Install or upgrade both packages at the
  same revision; interactive `ub-agents launch` then opens its own session's view.
  `launch --no-ui` and noninteractive output stay plain; `q` closes only the view.
  Installation does not change services or permissions.

The #116 packaging PR pins both packages to its reviewed implementation commit.
A release/tag publication and operator rollout remain separate maintainer actions.
