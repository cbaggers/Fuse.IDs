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

namespace Fuse.AdIDInternals
{
    /**
    */
    [UXGlobalModule]
    public sealed class AdIDModule : NativeModule
    {
        static readonly AdIDModule _instance;

        public AdIDModule()
        {
            if(_instance != null) return;
            Uno.UX.Resource.SetGlobalKey(_instance = this, "FuseJS/AdID");
            AddMember(new NativePromise<string, string>("get", GetID));
        }

        static Future<string> GetID(object[] args)
        {
            return new AdIDRequest();
        }
    }
}
