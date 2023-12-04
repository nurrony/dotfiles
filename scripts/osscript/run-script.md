## Add `Run Script` option on Context menu

1. **Name:** Run Script
1. **Description:** Makes the selected shell script executable and then runs it.
1. **Shell:** `/bin/bash`
1. **Filters:** `Use on files`
1. **Accepted File Types:** `sh`
1. **Script:**

```bash
chmod +x $PATH;
sh $PATH;
```
