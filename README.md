# dominion525 tap

Homebrew casks for my macOS apps, and formulae for my command-line tools.

## Install

```
brew install --cask dominion525/tap/blip-cursor
brew install dominion525/tap/jetdb
```

Installing by the fully qualified name adds the tap and trusts only that cask or formula. See
[Tap Trust](https://docs.brew.sh/Tap-Trust) for the trust model.

## Casks

```
blip-cursor   Blip, a menu bar utility that highlights the mouse cursor
              https://github.com/dominion525/blip
```

The cask is not called `blip` because that name is already taken by an unrelated cask in
homebrew/cask, and cask names have to be unique across all of them.

## Formulae

```
jetdb         Read Microsoft Access databases (.mdb/.accdb) from the command-line
              https://github.com/dominion525/jetdb
```

The formula installs the binaries built by the release of jetdb, for macOS (Apple silicon and
Intel) and Linux (x86_64).

## Updating

Each cask is bumped by the release workflow of the app it packages. There is nothing to
run here by hand.
