## Wezterm Configurations

This folder contains Wezterm configurations. Copy `wezterm` folder to `$HOME/.config`

### Credential File

This setup provides simple password manager support using [PassRelay Wezterm Plugin](https://github.com/dfaerch/passrelay.wezterm). Please create a `creds.json` file in following format and press <kbd>CMD</kbd> + <kbd>CTRL</kbd> + <kbd>f</kbd> to activate the plugin

> **NOTE: `creds.json` is ignored in git**

```json
{
  "github": {
    "rony": "ghp_xxxxx"
  },
  "docker": {
    "rony": "docker_token"
  },
  "prod-db": {
    "admin": "supersecret",
    "root": "rootpass"
  }
}
```
