## Add `New Empty File` option in Context menu

1. **Name:** New Empty File
1. **Description:** Creates a new file with the title "🤘emptyfile" (this positions the file at the top because of the emoji). You can then rename the file to the name you want and add an ending (e.g .docx or .html) to change the type of the file

1. **Shell:** `/bin/bash`
1. **Filters:** Use on directories
1. **Script:**

```sh
touch Untitled.txt
```
