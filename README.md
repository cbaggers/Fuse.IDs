# Fuse.AdID

Get the Advertisement ID for the device.

## Usage

### From JS

```
var AdID = require("FuseJS/AdID");

...

AdID.get().then(function(result) {
    console.log("ID: " + result);
}).catch(function(e) {
    info.value = "Fetch Failed:\n" + e;
});
```

### From Uno

```
void SomeTest()
{
    Fuse.AdID.Get().Then(Show)
}

void Show(string id)
{
    debug_log "ID: " + id;
}

```
