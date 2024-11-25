# MacOS specific

## No screenshot shaddow

```
defaults write com.apple.screencapture disable-shadow -bool true; killall SystemUIServer
```

## Never show Dock

```
defaults write com.apple.dock autohide-delay -float 1000; killall Dock
```
