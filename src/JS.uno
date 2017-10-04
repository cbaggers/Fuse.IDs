using Uno;
using Uno.UX;
using Uno.Threading;
using Uno.Text;
using Uno.Platform;
using Uno.Compiler.ExportTargetInterop;
using Uno.Collections;
using Fuse;
using Fuse.Scripting;
using Fuse.Reactive;

namespace Fuse.IDInternals
{
    /**
    */
    [UXGlobalModule]
    public sealed class IDModule : NativeModule
    {
        static readonly IDModule _instance;

        public IDModule()
        {
            if(_instance != null) return;
            Uno.UX.Resource.SetGlobalKey(_instance = this, "FuseJS/IDs");
            AddMember(new NativePromise<string, string>("deviceID", GetDeviceID));
            AddMember(new NativePromise<string, string>("adID", GetAdID));
        }

        static Future<string> GetDeviceID(object[] args)
        {
            return new DeviceIDRequest();
        }

        static Future<string> GetAdID(object[] args)
        {
            return new AdIDRequest();
        }
    }
}
