# Fuse.IDs

Get the IDs for the device.

The `AdID` is the advertising ID. It may be the same across multiple devices and can be reset at any time by the user.

The `AppDeviceID` is an ID that is unique to (at least) that app vendor on that device. It can change if all apps by that vendor are uninstalled and then reinstalled.

## Usage

### From JS

```
var IDs = require("FuseJS/IDs");

...

IDs.adID().then(function(result) {
    console.log("ID: " + result);
}).catch(function(e) {
    info.value = "Fetch Failed:\n" + e;
});

...

IDs.appDeviceID().then(function(result) {
    console.log("ID: " + result);
}).catch(function(e) {
    info.value = "Fetch Failed:\n" + e;
});
```

### From Uno

```
void SomeTest()
{
    Fuse.IDs.AdID().Then(Show)
}

void SomeOtherTest()
{
    Fuse.IDs.AppDeviceID().Then(Show)
}

void Show(string id)
{
    debug_log "ID: " + id;
}

```
