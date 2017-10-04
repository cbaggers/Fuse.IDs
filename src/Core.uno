using Uno;
using Uno.UX;
using Uno.Threading;
using Uno.Collections;
using Uno.Compiler.ExportTargetInterop;

namespace Fuse.AdIDInternals
{
    extern(Android)
    class AdIDRequest : Promise<string>
    {
        [Require("Gradle.Dependency.Compile", "com.google.android.gms:play-services-ads:9.2.0")]
        [Foreign(Language.Java)]
        public AdIDRequest()
        @{
            android.os.AsyncTask<Void, Void, String> task = new android.os.AsyncTask<Void, Void, String>()
            {
                Exception _err = null;

                protected String doInBackground(Void... voids)
                {
                    try
                    {
                        return com.google.android.gms.ads.identifier.AdvertisingIdClient.getAdvertisingIdInfo(com.fuse.Activity.getRootActivity()).getId();
                    }
                    catch (Exception e)
                    {
                        _err = e;
                        return null;
                    }
                }

                protected void onPostExecute(String result)
                {
                    if (_err != null)
                    {
                        @{AdIDRequest:Of(_this).Reject(string):Call(_err.getLocalizedMessage())};
                    }
                    else
                    {
                        @{AdIDRequest:Of(_this).Resolve(string):Call(result)};
                    }
                }
            };
            task.execute();
        @}

        void Reject(string reason) { Reject(new Exception(reason)); }
    }

    extern(iOS)
    class AdIDRequest : Promise<string>
    {
        public AdIDRequest()
        {
            Resolve(AdID());
        }

        [Require("Source.Include", "Foundation/Foundation.h")]
        [Foreign(Language.ObjC)]
        public static string AdID()
        @{
            // This ID is unique for the app vendor on that device, it
            // will change if the app is uninstalled & reinstalled
            return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        @}
    }

    extern(!MOBILE)
    class AdIDRequest : Promise<string>
    {
        public AdIDRequest()
        {
            Reject(new Exception("AdIDRequest is not implemented on this platform"));
        }
    }
}

namespace Fuse
{
    public static class AdID
    {
        public static Future<string> Get()
        {
            return new AdIDInternals.AdIDRequest();
        }
    }
}
