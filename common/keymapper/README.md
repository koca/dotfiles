# Keymapper Notes

## Resources

- Get key code: https://www.toptal.com/developers/keycode

## MacOS



###  Updated files

#### ./keymapper-launchd file

- added:

```xml
<key>UserName</key>
<string>root</string>
```


#### ./keymapper.rb file

from https://github.com/houmain/homebrew-tap


### Manual Uninstall

```bash
sudo keymapper-launchd remove

sudo rm -rf /Library/LaunchDaemons/keymapperd.plist
sudo rm -rf /Library/LaunchAgents/keymapper.plist

sudo rm -rf /usr/local/bin/keymapper
sudo rm -rf /usr/local/bin/keymapperd
sudo rm -rf /usr/local/bin/keymapperctl
sudo rm -rf /usr/local/bin/keymapper-launchd
```

## plist files

```sh
vim /Library/LaunchDaemons/keymapperd.plist
vim /Library/LaunchAgents/keymapper.plist
```

## Manual testing

### Keymapperd Permissions issue

sometimes there is an issue on macos where keymapperd is not able to grab the virtual device.


to fix this, we can try running:

```bash
sudo keymapperd -v
```

we should see that grabbing virtual device should be successful.

### Keymapper not running

sometimes keymapper is not running.

to fix this, we can try running:

```bash
keymapper -v
```

this should run in background


## Launchd deamons/agents call

To add keymapperd and keymapper to the launchd daemons/agents call:

```bash
sudo ./script.sh add
```

To remove them call:

```bash
sudo ./script.sh remove
```



# load launchd daemons/agent
launchctl load /Library/LaunchDaemons/keymapperd.plist