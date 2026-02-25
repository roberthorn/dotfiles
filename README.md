# dotfiles

What I'm using... Always a WIP

## Install

`mise configure`

## Setting up hyper key

My hyper key is set up using `hidutil`. In order to have the mapping persist reboots, we need to load the `com.local.KeyRemapping.plist` service file (generated with [this tool](https://hidutil-generator.netlify.app/)).

```bash
# move the file into place
copy ./com.local.KeyRemapping.plist ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# load and start the service
launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist
launchctl start com.local.KeyRemapping
```
