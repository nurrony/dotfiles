## Add `Generate Iconset` option on Context menu

1. **Name:** Open iTerm Window
1. **Description:** Converts an PNG image to OSX ready icons (16x16, 32x32, 128x128, 256x256, and 512x512). If the image isn't big enough to be downscaled, the converted image will be upscaled (this should be avoided).
1. **Shell:** `/bin/bash`
1. **Filters:** Use on files
1. **Accepted File Types:** `png`
1. **Script:**

```bash
mkdir Icon.iconset
cp $PATH Icon.iconset/Icon_512x512.png
cp $PATH Icon.iconset/Icon_512x512@2x.png
cp $PATH Icon.iconset/Icon_512x512@3x.png
cp $PATH Icon.iconset/Icon_256x256.png
cp $PATH Icon.iconset/Icon_256x256@2x.png
cp $PATH Icon.iconset/Icon_256x256@3x.png
cp $PATH Icon.iconset/Icon_128x128.png
cp $PATH Icon.iconset/Icon_128x128@2x.png
cp $PATH Icon.iconset/Icon_128x128@3x.png
cp $PATH Icon.iconset/Icon_32x32.png
cp $PATH Icon.iconset/Icon_32x32@2x.png
cp $PATH Icon.iconset/Icon_32x32@3x.png
cp $PATH Icon.iconset/Icon_16x16.png
cp $PATH Icon.iconset/Icon_16x16@2x.png
cp $PATH Icon.iconset/Icon_16x16@3x.png
sips -Z 512 Icon.iconset/Icon_512x512.png
sips -Z 1024 Icon.iconset/Icon_512x512@2x.png
sips -Z 1536 Icon.iconset/Icon_512x512@3x.png
sips -Z 256 Icon.iconset/Icon_256x256.png
sips -Z 512 Icon.iconset/Icon_256x256@2x.png
sips -Z 768 Icon.iconset/Icon_256x256@3x.png
sips -Z 128 Icon.iconset/Icon_128x128.png
sips -Z 256 Icon.iconset/Icon_128x128@2x.png
sips -Z 384 Icon.iconset/Icon_128x128@3x.png
sips -Z 32 Icon.iconset/Icon_32x32.png
sips -Z 64 Icon.iconset/Icon_32x32@2x.png
sips -Z 96 Icon.iconset/Icon_32x32@3x.png
sips -Z 16 Icon.iconset/Icon_16x16.png
sips -Z 32 Icon.iconset/Icon_16x16@2x.png
sips -Z 48 Icon.iconset/Icon_16x16@3x.png
```
