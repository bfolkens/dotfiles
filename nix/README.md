# First run

```
nix run nix-darwin -- switch --flake .
```

# How to update/upgrade system

1. Update and see raw lock changes

```
nix flake update
git diff flake.lock
```

2. Build and compare packages

```
sudo darwin-rebuild build --flake .
nvd diff /run/current-system ./result
```

3. If happy, apply

```
sudo darwin-rebuild switch --flake .
```
