#import "TikTok.h"


NSArray *jailbreakPaths = @[
///Applications
@"/Applications/Zebra.app",
@"/Applications/Cydia.app", @"/Applications/blackra1n.app",
@"/Applications/FakeCarrier.app", @"/Applications/Icy.app",
@"/Applications/IntelliScreen.app", @"/Applications/MxTube.app",
@"/Applications/RockApp.app", @"/Applications/SBSettings.app", @"/Applications/WinterBoard.app",

//.
@"/.cydia_no_stash", @"/.installed_unc0ver", @"/.bootstrapped_electra",

//usr
//firmware /supersling

@"/usr/libexec/firmware",
@"/usr/libexec/cydia/supersling",
@"/usr/libexec/cydia/firmware.sh", @"/usr/libexec/ssh-keysign", @"/usr/libexec/sftp-server",
@"/usr/bin/ssh", @"/usr/bin/sshd", @"/usr/sbin/sshd",

//var
@"/var/lib/cydia", @"/var/lib/dpkg/info/mobilesubstrate.md5sums",
@"/var/log/apt", @"/usr/share/jailbreak/injectme.plist", @"/usr/sbin/frida-server",

//Library
@"/Library/MobileSubstrate/CydiaSubstrate.dylib", @"/Library/TweakInject",
@"/Library/MobileSubstrate/MobileSubstrate.dylib", @"Library/MobileSubstrate/MobileSubstrate.dylib",
@"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist", @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",

//System
@"/System/Library/LaunchDaemons/com.ikey.bbot.plist", @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist", @"/System/Library/CoreServices/SystemVersion.plist",

//private
@"/private/var/mobile/Library/SBSettings/Themes", @"/private/var/lib/cydia",
@"/private/var/tmp/cydia.log", @"/private/var/log/syslog",
@"/private/var/cache/apt/", @"/private/var/lib/apt",
@"/private/var/Users/", @"/private/var/stash",

//usr
@"/usr/lib/libjailbreak.dylib", @"/usr/lib/libz.dylib",
@"/usr/lib/system/introspectionNSZombieEnabled",
@"/usr/lib/dyld",

//jb
@"/jb/amfid_payload.dylib", @"/jb/libjailbreak.dylib",
@"/jb/jailbreakd.plist", @"/jb/offsets.plist",
@"/jb/lzma",

//hmd
@"/hmd_tmp_file",

//etc
@"/etc/ssh/sshd_config", @"/etc/apt/undecimus/undecimus.list",
@"/etc/apt/sources.list.d/sileo.sources", @"/etc/apt/sources.list.d/electra.list",
@"/etc/apt", @"/etc/ssl/certs", @"/etc/ssl/cert.pem",

//bin
@"/bin/sh", @"/bin/bash",
];


%group HooksTikTokByPass
#pragma mark - Bypass Securtiy
%hook NSFileManager
-(BOOL)fileExistsAtPath:(id)arg1 {
for (NSString *file in jailbreakPaths) {
if ([arg1 isEqualToString:file]) {
return NO;
}
}
return %orig;
}

-(BOOL)fileExistsAtPath:(id)arg1 isDirectory:(BOOL*)arg2 {
for (NSString *file in jailbreakPaths) {
if ([arg1 isEqualToString:file]) {
return NO;
}
}
return %orig;
}
%end

%hook BDADeviceHelper
+(bool)isJailBroken {
return NO;
}
%end

%hook UIDevice
+(bool)btd_isJailBroken {
return NO;
}
%end

%hook TTInstallUtil
+(bool)isJailBroken {
return NO;
}
%end

%hook AppsFlyerUtils
+(bool)isJailbrokenWithSkipAdvancedJailbreakValidation:(bool)arg2 {
return NO;
}
%end

%hook PIPOIAPStoreManager
-(bool)_pipo_isJailBrokenDeviceWithProductID:(id)arg2 orderID:(id)arg3 {
return NO;
}
%end

%hook IESLiveDeviceInfo
+(bool)isJailBroken {
return NO;
}
%end

%hook PIPOStoreKitHelper
-(bool)isJailBroken {
return NO;
}
%end

%hook BDInstallNetworkUtility
+(bool)isJailBroken {
return NO;
}
%end

%hook TTAdSplashDeviceHelper
+(bool)isJailBroken {
return NO;
}
%end




%hook GULAppEnvironmentUtil
+(bool)isAppStoreReceiptSandbox {
    return 1;
}
+(bool)isFromAppStore {
return YES;
}

+(bool)isAppExtension {
return YES;
}
%end

%hook FBSDKAppEventsUtility
+(bool)isDebugBuild {
return NO;
}
%end

%hook AWEAPMManager
+(id)signInfo {
return @"AppStore";
}
%end



//real bypass

%hook AWESecurity
- (void)resetCollectMode {
return;
}
%end

%hook MSManagerOV
- (id)setMode {
return (id (^)(id)) ^{};
}
%end

%hook MSConfigOV
- (id)setMode {
return (id (^)(id)) ^{};
}
%new
- (void)ASS{
    NSLog(@"*TxCShowView %@",TxCShowView());
}
%end


%hook BDASandBoxHelper
+ (bool)isAppStoreChannel {
    return 1;
}
%end



%hook TTInstallSandBoxHelper
+ (bool)isAppStoreChannel {
    return 1;
}
%end

%hook AWETrackerProjectInfo
+ (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end


%hook TWTRCore
+ (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook FBSDKAppEventsDeviceInfo
- (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook AFSDKEvent
- (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook TTInstallSandBoxHelper
+ (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook HTSNHProjectInfo
+ (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook HMDInfo
- (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook FIRInstallationsIIDStore
- (id)mainbundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook IESEffectConfig
- (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook ACCDeviceInfo
+ (id)acc_bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook BDASandBoxHelper
+ (id)bundleIdentifier {
    return @"com.zhiliaoapp.musically";
}
%end

%hook AWEStartupTimingMonitorManager
+ (void)start {
    %orig;
}
%end
%end 
%ctor{
    if(BUNDLEIDEQUALS(@"com.zhiliaoapp.musically")){
        %init(HooksTikTokByPass);
    }
}

