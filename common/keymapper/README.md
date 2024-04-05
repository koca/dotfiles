# Keymapper Notes

## MacOS

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

