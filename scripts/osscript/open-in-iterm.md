## Add Open in iTerm option on Context menu

1. **Name:** Open iTerm Window
1. **Description:** Opens a new iTerm window in the selected directory.
1. **Shell:** `/usr/bin/env osascript`
1. **Filters:** Use on directories
1. **Accepted File Types:** `*`
1. **Script:**

```osscript
if application "iTerm" is running then
  tell application "iTerm"
    create window with default profile
    activate
    tell the current window
      activate current session
      tell current session
        write text "cd " & $PATH & "; clear"
      end tell
    end tell
  end tell
else
  activate application "iTerm"
  tell application "iTerm"
    tell current window
      tell current session
        write text "cd " & $PATH & "; clear"
      end tell
    end tell
  end tell
end if
```
