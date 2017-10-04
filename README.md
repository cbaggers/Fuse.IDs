# Fuse.IDs

Get the IDs for the device.

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

IDs.deviceID().then(function(result) {
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
    Fuse.IDs.DeviceID().Then(Show)
}

void Show(string id)
{
    debug_log "ID: " + id;
}

```
