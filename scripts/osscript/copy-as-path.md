## Add Copy as Path option on Context menu

1. **Name:** Copy as Path
1. **Description:** Copies the path of either the current directory or the selected file/directory.
1. **Shell:** `/bin/bash`
1. **Filters:** `Use on files` and `Use on directories`
1. **Accepted File Types:** `*`
1. **Script:**

```bash
export LANG="en_US.UTF-8"; echo -n $PATH | pbcopy
```
