## Add `Git Information` option in Context menu

1. **Name:** Git Information
1. **Description:** Show Last commit information.
1. **Shell:** `/usr/bin/env osascript`
1. **Filters:** Use on directories
1. **Accepted File Types:**
1. **Script:**

```bash
set someCondition to do shell script "git rev-parse --is-inside-work-tree"
if someCondition = "true" then
  set currentBranch to do shell script "git branch --show-current"
  set lastSHA1 to do shell script "git log -1 --pretty=format:'%h'"
  set author to do shell script "git log -1 --pretty=format:'%an <%ae>'"
  set commitDate to do shell script "git log -1 --pretty=format:'%ad' --date=iso"
  set commitMessage to do shell script "git log -1 --pretty=format:'%s'"
  display dialog "Current Branch: " & currentBranch & return & "SHA1 Checksum: " & lastSHA1 & return & "Author: " & author & return & "Date: " & commitDate & return & "Message: " & return & commitMessage & return with title "Last Commit Information" buttons {"OK"}  default button "OK" with icon POSIX file "$HOME/.dotfiles/icons/git-bash.png"
end if
```
