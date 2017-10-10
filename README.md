# Fuse.IDs

Get the IDs for the device.

## The IDs

The `AdID` is the advertising ID. It may be the same across multiple devices and can be reset at any time by the user.

The `AppDeviceID` is an ID that is unique to (at most) that app vendor on that device. It can change if all apps by that vendor are uninstalled and then reinstalled. It may be the same for all apps.

## Device Specifics

As IDs are not implemented the same by different providers we have to promise only the most general behavior between them. Here are the device/provider specific details, this is for curiosity only and you should not assume this behavior in your apps.

### Android
- `AdID` is tied to the google account
- `AppDeviceID` is only reset on OS reinstall. It is the same for all apps on the device.

### iOS
- `AppDeviceID` is specific to the app vendor. It is shared by apps by the same vendor but not more

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
