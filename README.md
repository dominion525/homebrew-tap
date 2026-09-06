# dominion525 tap

Homebrew casks for my macOS apps.

## Install

```
brew install --cask dominion525/tap/blip-cursor
```

Installing by the fully qualified name adds the tap and trusts only that cask. See
[Tap Trust](https://docs.brew.sh/Tap-Trust) for the trust model.

## Casks

```
blip-cursor   Blip, a menu bar utility that highlights the mouse cursor
              https://github.com/dominion525/blip
```

The cask is not called `blip` because that name is already taken by an unrelated cask in
homebrew/cask, and cask names have to be unique across all of them. It was
`dominion525-blip` until 0.2.1; `cask_renames.json` carries anyone installed under that name
across on their next `brew upgrade`.

## Updating

Each cask is bumped by the release workflow of the app it packages. There is nothing to
run here by hand.
