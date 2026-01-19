mkdir -p "$HOME/Library/Scripts/blinkscreen"
cat > "$HOME/Library/Scripts/blinkscreen/blinkscreen.sh" <<'SH'
#!/bin/zsh
# Blinks by toggling Invert Colors (Ctrl+Opt+Cmd+8).
# Runs forever: 5 blinks every 20 minutes.

blink_5x() {
  /usr/bin/osascript <<'APPLESCRIPT'
tell application "System Events"
  repeat 5 times
    key code 28 using {control down, option down, command down}
    delay 0.12
    key code 28 using {control down, option down, command down}
    delay 0.12
  end repeat
end tell
APPLESCRIPT
}

while true; do
  sleep 1200
  blink_5x
done
SH

chmod +x "$HOME/Library/Scripts/blinkscreen/blinkscreen.sh"