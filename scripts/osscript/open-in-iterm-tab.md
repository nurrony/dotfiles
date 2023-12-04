## Add `Open iTerm Tab` option on Context menu

1. **Name:** Open iTerm Tab
1. **Description:** Opens a new iTerm tab in the current directory.
1. **Shell:** `/usr/bin/env osascript`
1. **Filters:** Use on directories
1. **Accepted File Types:**
1. **Script:**

```bash
tell application "iTerm"
    tell current window
        create tab with default profile
        activate
        tell the current tab
            activate current session
            launch session "Default Session"
            tell the last session
                write text "cd " & $PATH & "; clear"
            end tell
        end tell
    end tell
end tell
```
