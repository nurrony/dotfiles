## Add Open in VSCode option on Context menu

1. **Name:** Open in VSCode
1. **Description:** Opens the selected directory/file in VSCode.
1. **Shell:** `/bin/bash`
1. **Filters:** `Use on files` and `Use on directories`
1. **Accepted File Types:** none
1. **Script:**

```bash
/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code $PATH
```
