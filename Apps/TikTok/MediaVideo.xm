#import "TikTok.h"





static BOOL TxCTikTokHiddenInt = NO;
static BOOL DisableAdsTikTok = YES;
static BOOL UnlimitedDownloadVideo = YES;
static BOOL BOOLProgressBar;

%group HooksTikTokMediaVideo
%hook AWEFeedContainerViewController
static AWEFeedContainerViewController *__weak ShareUIUnHidden;
%property (nonatomic, assign) BOOL AFSocialUIHidden;
- (id)init {
id orig = %orig;
self.AFSocialUIHidden = NO;
ShareUIUnHidden = orig;
return orig;
}

%new
+ (AWEFeedContainerViewController *)ShareUIUnHidden {
return ShareUIUnHidden;
}
// hide search
-(bool)enableShowSearchTip{
if([TxCManagerHelper TxCGetSettings:@"HIDE_SEARCH_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}

-(bool)enableSearchEntrance{
if([TxCManagerHelper TxCGetSettings:@"HIDE_SEARCH_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
// hide live
-(bool)_shouldShowMTLiveEntranceView{
if([TxCManagerHelper TxCGetSettings:@"HIDE_SEARCH_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end


// Save Search & Show Profile
%hook AWEAwemeDetailCellViewController
- (void)updateShouldPrepareForDisplay:(BOOL)arg1{
%orig;

if([TxCManagerHelper TxCGetSettings:@"SHOW_COUNTRY_UPLOAD_VIDEO_TIKTOK"]){
[TxCManagerHelper TxCUILabelRegion:self.model.region Width:170 InView:self.view];
}

if([TxCManagerHelper TxCGetSettings:@"SAVE_VIDEO_TIKTOK"]){
UIImage *Save = [TxCManagerHelper TxCImage:@"square.and.arrow.down"];
[TxCManagerHelper TxCButtonVideoTikTok:Save Width:290 InView:self.view Target:self Action:@selector(AFSocialButtonTikTok:)];
}

if([TxCManagerHelper TxCGetSettings:@"COPY_DATA_TIKTOK"]){
UIImage *Copy = [TxCManagerHelper TxCImage:@"doc.on.clipboard"];
[TxCManagerHelper TxCButtonVideoTikTok:Copy Width:250 InView:self.view Target:self Action:@selector(CopyUser:)];
}

if([TxCManagerHelper TxCGetSettings:@"HIDE_UI_TIKTOK"]){
UIImage *Eyes = [TxCManagerHelper TxCImage:@"eye.slash"];
[TxCManagerHelper TxCButtonVideoTikTok:Eyes Width:210.0 InView:self.view Target:self Action:@selector(TxCHideUiButtonPressed:)];
dispatch_async(dispatch_get_main_queue(), ^{
[self TxCStatusIntHiddenTikTok];
});
}
}
%new
- (void)TxCHideUiButtonPressed:(UIButton *)sender {
if(!TxCTikTokHiddenInt){
TxCTikTokHiddenInt = YES;
} else {
TxCTikTokHiddenInt = NO;
}

[self TxCStatusIntHiddenTikTok];

}

%new
- (void)TxCStatusIntHiddenTikTok{


AWEPlayInteractionContext *interactionContext = [[self valueForKey:@"_interactionContext"] valueForKey:@"_interactionViewIfLoaded"];
interactionContext.hidden = TxCTikTokHiddenInt;
}
%new
- (void)CopyUser:(UIButton *)sender {


dispatch_async(dispatch_get_main_queue(), ^{

NSString *UsernameProfile   = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_customID"];
NSString *SignatureProfile  = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_signature"];
NSString *NicknameProfile   = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_nickname"];
NSString *BioUrlProfile     = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_bioUrl"];
NSArray *originURLList      = [[[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_avatarThumb"] valueForKey:@"_originURLList"];
NSString *ProfileImage      = [originURLList firstObject];

[TxCManagerHelper TxCDataProfile:@"TikTok" Username:UsernameProfile FullName:NicknameProfile Bio:self.model.descriptionString BioLink:BioUrlProfile ProfileImage:ProfileImage];


});

}
%new
- (void)AFSocialButtonTikTok:(UIButton *)sender {
dispatch_async(dispatch_get_main_queue(), ^{
NSURL * directURL = [NSURL URLWithString:self.model.video.playURL.originURLList.firstObject];
NSString* title = [[directURL lastPathComponent] stringByDeletingPathExtension];
NSString * pathSave = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4", [directURL lastPathComponent]]];
[TxCManagerHelper TxCManagerDownloadingMediaWithPath:directURL Path:pathSave];
});
}
%end

// Home Page
%hook AWEFeedCellViewController
- (void)updateShouldPrepareForDisplay:(BOOL)arg1{
%orig;

if([TxCManagerHelper TxCGetSettings:@"SHOW_COUNTRY_UPLOAD_VIDEO_TIKTOK"]){
[TxCManagerHelper TxCUILabelRegion:self.model.region Width:170 InView:self.view];
}

if([TxCManagerHelper TxCGetSettings:@"SAVE_VIDEO_TIKTOK"]){
UIImage *Save = [TxCManagerHelper TxCImage:@"square.and.arrow.down"];
[TxCManagerHelper TxCButtonVideoTikTok:Save Width:290 InView:self.view Target:self Action:@selector(AFSocialButtonTikTok:)];
}

if([TxCManagerHelper TxCGetSettings:@"COPY_DATA_TIKTOK"]){
UIImage *Copy = [TxCManagerHelper TxCImage:@"doc.on.clipboard"];
[TxCManagerHelper TxCButtonVideoTikTok:Copy Width:250 InView:self.view Target:self Action:@selector(CopyUser:)];
}

 if([TxCManagerHelper TxCGetSettings:@"HIDE_UI_TIKTOK"]){

UIImage *Eyes = [TxCManagerHelper TxCImage:@"eye.slash"];
[TxCManagerHelper TxCButtonVideoTikTok:Eyes Width:210.0 InView:self.view Target:self Action:@selector(TxCHideUiButtonPressed:)];

dispatch_async(dispatch_get_main_queue(), ^{
[self TxCStatusIntHiddenTikTok];
});
 }

}
%new
- (void)TxCHideUiButtonPressed:(UIButton *)sender {
if(!TxCTikTokHiddenInt){
TxCTikTokHiddenInt = YES;
} else {
TxCTikTokHiddenInt = NO;
}
[self TxCStatusIntHiddenTikTok];
}

%new
- (void)TxCStatusIntHiddenTikTok{

AWEPlayInteractionContext *interactionContext = [[self valueForKey:@"_interactionContext"] valueForKey:@"_interactionViewIfLoaded"];
interactionContext.hidden = TxCTikTokHiddenInt;
}
%new
- (void)CopyUser:(UIButton *)sender {
dispatch_async(dispatch_get_main_queue(), ^{
NSString *UsernameProfile   = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_customID"];
NSString *SignatureProfile  = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_signature"];
NSString *NicknameProfile   = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_nickname"];
NSString *BioUrlProfile     = [[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_bioUrl"];
NSArray *originURLList      = [[[[self valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_avatarThumb"] valueForKey:@"_originURLList"];
NSString *ProfileImage      = [originURLList firstObject];

[TxCManagerHelper TxCDataProfile:@"TikTok" Username:UsernameProfile FullName:NicknameProfile Bio:self.model.descriptionString BioLink:BioUrlProfile ProfileImage:ProfileImage];


});


}
%new
- (void)AFSocialButtonTikTok:(UIButton *)sender {
dispatch_async(dispatch_get_main_queue(), ^{
NSURL * directURL = [NSURL URLWithString:self.model.video.playURL.originURLList.firstObject];
NSString* title = [[directURL lastPathComponent] stringByDeletingPathExtension];
NSString * pathSave = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4", [directURL lastPathComponent]]];
[TxCManagerHelper TxCManagerDownloadingMediaWithPath:directURL Path:pathSave];
});
}
%new
- (void)ASS{
    NSLog(@"*TxCShowView %@",TxCShowView());
}
%end







%hook AWEFavoriteAwemeViewController
- (id)init {
if([TxCManagerHelper TxCGetSettings:@"KEY_FAVORITES_COLLECTIONS_TIKTOK"]){
return [%c(TTKFavoriteAwemeCollectionsViewController) new];
} else {
return %orig;
}
}
%end

static BOOL azfVerifiedUser = YES;
// Account_Verification_TIKTOK
%hook AWEUserModel
-(bool)isVerifiedUser {
    if([TxCManagerHelper TxCGetSettings:@"ACCOUNT_VERIFICATION_TIKTOK"]){
return azfVerifiedUser || %orig;
}
return %orig;
}
-(bool)isVerifiedUserI18N {
 if([TxCManagerHelper TxCGetSettings:@"ACCOUNT_VERIFICATION_TIKTOK"]){
return azfVerifiedUser || %orig;
}
return %orig;
}
%end



// Skip Watch Live
%hook AWEMTLiveFollowViewController
- (bool)isLiveShowing{
if([TxCManagerHelper TxCGetSettings:@"KEY_SKIP_WATCH_LIVE_TIKTOK"]){
return FALSE;
} else {
return %orig;
}
return %orig;
}
%end

// More of letters in the comment
%hook AWECommentListInputView
- (long long)getMaxInputCount{
if([TxCManagerHelper TxCGetSettings:@"KEY_MORE_OF_LETTERS_COMMENT_TIKTOK"]){
return 240;
} else {
return %orig;
}
return %orig;

}
%end


%hook AWECommentPanelBaseCell
- (void)likeButtonTapped{
if([TxCManagerHelper TxCGetSettings:@"KEY_CONFRIM_LIKE_TIKTOK"]){
[TxCManagerHelper ConfrimLikeButton:(^(void) { %orig; })];
} else {
return %orig;
}
}
%end

%hook TTKFeedInteractionLikeManager
- (void)onLikeButtonClicked{
if([TxCManagerHelper TxCGetSettings:@"KEY_CONFRIM_LIKE_TIKTOK"]){
[TxCManagerHelper ConfrimLikeButton:(^(void) { %orig; })];
} else {
return %orig;
}
}
- (void)onFollowViewClicked{
if([TxCManagerHelper TxCGetSettings:@"KEY_CONFRIM_FOLLOW_TIKTOK"]){
[TxCManagerHelper ConfrimLikeButton:(^(void) { %orig; })];
} else {
return %orig;
}
}
%end

%hook AWEPlayInteractionUserAvatarElementViewModel
- (void)onFollowViewClicked:(id)arg1{
if([TxCManagerHelper TxCGetSettings:@"KEY_CONFRIM_FOLLOW_TIKTOK"]){
[TxCManagerHelper ConfrimLikeButton:(^(void) { %orig; })];
} else {
return %orig;
}
}
%end


// This option unmutes the audio in videos where the audio is muted by the user or app
%hook AWEAwemeStatusModel
- (void)setVideoMuteModel:(id)arg1{
if([TxCManagerHelper TxCGetSettings:@"KEY_OPTION_UNMAUTE_TIKTOK"]){
arg1 = NULL;
return %orig(arg1);
} else {
return %orig;
}

}
%end



// %hook AWEAwemeModel
// - (id)initWithDictionary:(id)arg1 error:(id *)arg2 {
// return [TxCManagerHelper TxCGetSettings:@"DISABLE_ADS_TIKTOK"] && self.isAds ? nil : self;
// }
// - (id)init {
// self = %orig;
// return [TxCManagerHelper TxCGetSettings:@"DISABLE_ADS_TIKTOK"] && self.isAds ? nil : self;
// }
// - (BOOL)progressBarDraggable {
// return BOOLProgressBar || %orig;
// }
// - (BOOL)progressBarVisible {
// return BOOLProgressBar || %orig;
// }

// - (BOOL)preventDownload {
// if([TxCManagerHelper TxCGetSettings:@"UNLIMITED_DOWNLOAD_VIDEO_TIKTOK"]){
// return UnlimitedDownloadVideo ? FALSE : %orig;
// } else{
// return %orig;
// }
// return %orig;
// }

// - (BOOL)disableDownload {
// if([TxCManagerHelper TxCGetSettings:@"UNLIMITED_DOWNLOAD_VIDEO_TIKTOK"]){
// return UnlimitedDownloadVideo ? FALSE : %orig;
// } else{
// return %orig;
// }
// return %orig;
// }
// %end



// Upload Video 1080p HD
%hook AWEVideoPublishSettingsViewModel
-(bool) enableHDPublish{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook AWEVideoRecordOutputParameter
-(bool) enableHDPublishSettingOn{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook IESMMParamModule
-(bool) enableHdrVsOptimization{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end


%hook IESMMParamModule
-(bool) enableHDModeUpload{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end


%hook IESMMParamModule
-(bool) enableHDRSetting{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end


%hook IESMMParamModule
-(bool) enableHdr10bitExport{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end


%hook VECompileVTEncoderUnit
-(bool) enableHdrVsOpt{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook VEEffectProcess
-(bool) enableHdrVsOptimization{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook VECompileReaderUnit
-(bool) enableHdrVsOptimization{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook IESFiltersManager
-(bool) enableHdrVsOptimization{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook ACCRepoVideoInfoModel
-(bool) enableHDRNet{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook AWEVideoDraftModel
-(bool) enableHDRNet{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook AWEVideoNewPublishViewController
-(bool) enableHDPublish{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

%hook AWEShoutoutsVideoPublishViewController
-(bool) enableHDPublish{
if([TxCManagerHelper TxCGetSettings:@"UPLOAD_VIDEO_1080P_TIKTOK"]){
return 0;
} else {
return %orig;
}
return %orig;
}
%end

@interface AWEPhotoAlbumModel : NSObject
- (NSInteger)currentIndex;
@end 

@interface AWEPlayPhotoAlbumViewController : UIViewController
@property (nonatomic, strong, readwrite) AWEAwemeModel *model;
@end 

@interface TTKPhotoAlbumFeedCellController : UIViewController
- (void)TxCStatusIntHiddenTikTok;
@end 

%hook TTKPhotoAlbumFeedCellController
 - (void)updateShouldPrepareForDisplay:(BOOL)arg1{
%orig;
 AWEPlayPhotoAlbumViewController *photoAlbumController;

@try {
photoAlbumController = [self valueForKey:@"_photoAlbumController"];
}@catch(NSException*e){
}

if([TxCManagerHelper TxCGetSettings:@"SHOW_COUNTRY_UPLOAD_VIDEO_TIKTOK"]){
[TxCManagerHelper TxCUILabelRegion:photoAlbumController.model.region Width:170 InView:self.view];
}


if([TxCManagerHelper TxCGetSettings:@"SAVE_VIDEO_TIKTOK"]){
UIImage *Save = [TxCManagerHelper TxCImage:@"square.and.arrow.down"];
[TxCManagerHelper TxCButtonVideoTikTok:Save Width:290 InView:self.view Target:self Action:@selector(AFSocialButtonTikTok:)];
}

if([TxCManagerHelper TxCGetSettings:@"COPY_DATA_TIKTOK"]){
UIImage *Copy = [TxCManagerHelper TxCImage:@"doc.on.clipboard"];
[TxCManagerHelper TxCButtonVideoTikTok:Copy Width:250 InView:self.view Target:self Action:@selector(CopyUser:)];
}

 if([TxCManagerHelper TxCGetSettings:@"HIDE_UI_TIKTOK"]){

UIImage *Eyes = [TxCManagerHelper TxCImage:@"eye.slash"];
[TxCManagerHelper TxCButtonVideoTikTok:Eyes Width:210.0 InView:self.view Target:self Action:@selector(TxCHideUiButtonPressed:)];


 }
}
%new
- (void)TxCHideUiButtonPressed:(UIButton *)sender {
if(!TxCTikTokHiddenInt){
TxCTikTokHiddenInt = YES;
} else {
TxCTikTokHiddenInt = NO;
}
[self TxCStatusIntHiddenTikTok];
}

%new
- (void)TxCStatusIntHiddenTikTok{

AWEPlayPhotoAlbumViewController *photoAlbumController = [self valueForKey:@"_photoAlbumController"];

AWEPlayInteractionContext *interactionContext = [[photoAlbumController valueForKey:@"_interactionContext"] valueForKey:@"_interactionViewIfLoaded"];
interactionContext.hidden = TxCTikTokHiddenInt;
}
%new
- (void)CopyUser:(UIButton *)sender {


dispatch_async(dispatch_get_main_queue(), ^{

AWEPlayPhotoAlbumViewController *photoAlbumController = [self valueForKey:@"_photoAlbumController"];

NSString *UsernameProfile   = [[[photoAlbumController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_customID"];
NSString *SignatureProfile  = [[[photoAlbumController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_signature"];
NSString *NicknameProfile   = [[[photoAlbumController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_nickname"];
NSString *BioUrlProfile     = [[[photoAlbumController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_bioUrl"];
NSArray *originURLList      = [[[[photoAlbumController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_avatarThumb"] valueForKey:@"_originURLList"];
NSString *ProfileImage      = [originURLList firstObject];

[TxCManagerHelper TxCDataProfile:@"TikTok" Username:UsernameProfile FullName:NicknameProfile Bio:photoAlbumController.model.descriptionString BioLink:BioUrlProfile ProfileImage:ProfileImage];


});

}
%new
- (void)AFSocialButtonTikTok:(UIButton *)sender {
dispatch_async(dispatch_get_main_queue(), ^{
AWEPlayPhotoAlbumViewController *photoAlbumController;
AWEPhotoAlbumModel *photoAlbum;
NSArray *photos;


@try {
photoAlbumController = [self valueForKey:@"_photoAlbumController"];
photoAlbum = [photoAlbumController.model valueForKey:@"_photoAlbum"];
photos = [photoAlbum valueForKey:@"_photos"];
}@catch(NSException*e){
}


if([TxCManagerHelper TxCGetSettings:@"SAVE_ALL_MEDIA"]){
for(NSArray* ItemNow in photos) {
id originPhotoURL = [ItemNow valueForKey:@"_originPhotoURL"];
NSArray *originURLList = [originPhotoURL valueForKey:@"_originURLList"];
NSURL * directURL = [NSURL URLWithString:originURLList.firstObject];
NSString* title = [[directURL lastPathComponent] stringByDeletingPathExtension];
NSString * pathSave = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", [directURL lastPathComponent]]];
[TxCManagerHelper TxCManagerDownloadingMediaWithPath:directURL Path:pathSave];

}
} else {
id ImageItem = [photos objectAtIndex:photoAlbum.currentIndex];
id originPhotoURL = [ImageItem valueForKey:@"_originPhotoURL"];
NSArray *originURLList = [originPhotoURL valueForKey:@"_originURLList"];
NSURL * directURL = [NSURL URLWithString:originURLList.firstObject];
NSString* title = [[directURL lastPathComponent] stringByDeletingPathExtension];
NSString * pathSave = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", [directURL lastPathComponent]]];
[TxCManagerHelper TxCManagerDownloadingMediaWithPath:directURL Path:pathSave];
}
});
}
%end 


// // Save Story 
// %hook TTKStoryDetailTableViewCell
// - (void)configWithModel:(id)model {
//     %orig;


// if([TxCManagerHelper TxCGetSettings:@"SAVE_VIDEO_TIKTOK"]){
// UIButton *hideElementButton = [UIButton buttonWithType:UIButtonTypeSystem];
// [hideElementButton setTag:999];
// [hideElementButton setTranslatesAutoresizingMaskIntoConstraints:false];
// [hideElementButton addTarget:self action:@selector(AFSocialButtonTikTok:) forControlEvents:UIControlEventTouchUpInside];
// [hideElementButton setImage:[TxCManagerHelper TxCImage:@"square.and.arrow.down"] forState:UIControlStateNormal];
// if (![self viewWithTag:999]) {
// [hideElementButton setTintColor:[UIColor whiteColor]];
// [self addSubview:hideElementButton];

// [NSLayoutConstraint activateConstraints:@[
// [hideElementButton.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:50],
// [hideElementButton.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-10],
// [hideElementButton.widthAnchor constraintEqualToConstant:30],
// [hideElementButton.heightAnchor constraintEqualToConstant:30],
// ]];
// }

// }

// if([TxCManagerHelper TxCGetSettings:@"COPY_DATA_TIKTOK"]){
// UIImage *Copy = [TxCManagerHelper TxCImage:@"doc.on.clipboard"];
// [TxCManagerHelper TxCButtonVideoTikTok:Copy Width:250 InView:self Target:self Action:@selector(CopyUser:)];
// }

//  if([TxCManagerHelper TxCGetSettings:@"HIDE_UI_TIKTOK"]){
// UIImage *Eyes = [TxCManagerHelper TxCImage:@"eye.slash"];
// [TxCManagerHelper TxCButtonVideoTikTok:Eyes Width:210.0 InView:self Target:self Action:@selector(TxCHideUiButtonPressed:)];

// dispatch_async(dispatch_get_main_queue(), ^{
// [self TxCStatusIntHiddenTikTok];
// });
//  }
  
// }
// - (void)configureWithModel:(id)model {
// %orig;


// if([TxCManagerHelper TxCGetSettings:@"SAVE_VIDEO_TIKTOK"]){
// UIButton *hideElementButton = [UIButton buttonWithType:UIButtonTypeSystem];
// [hideElementButton setTag:999];
// [hideElementButton setTranslatesAutoresizingMaskIntoConstraints:false];
// [hideElementButton addTarget:self action:@selector(AFSocialButtonTikTok:) forControlEvents:UIControlEventTouchUpInside];
// [hideElementButton setImage:[TxCManagerHelper TxCImage:@"square.and.arrow.down"] forState:UIControlStateNormal];
// if (![self viewWithTag:999]) {
// [hideElementButton setTintColor:[UIColor whiteColor]];
// [self addSubview:hideElementButton];

// [NSLayoutConstraint activateConstraints:@[
// [hideElementButton.topAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.topAnchor constant:50],
// [hideElementButton.trailingAnchor constraintEqualToAnchor:self.safeAreaLayoutGuide.trailingAnchor constant:-10],
// [hideElementButton.widthAnchor constraintEqualToConstant:30],
// [hideElementButton.heightAnchor constraintEqualToConstant:30],
// ]];
// }
// }

// if([TxCManagerHelper TxCGetSettings:@"COPY_DATA_TIKTOK"]){
// UIImage *Copy = [TxCManagerHelper TxCImage:@"doc.on.clipboard"];
// [TxCManagerHelper TxCButtonVideoTikTok:Copy Width:250 InView:self Target:self Action:@selector(CopyUser:)];
// }

//  if([TxCManagerHelper TxCGetSettings:@"HIDE_UI_TIKTOK"]){
// UIImage *Eyes = [TxCManagerHelper TxCImage:@"eye.slash"];
// [TxCManagerHelper TxCButtonVideoTikTok:Eyes Width:210.0 InView:self Target:self Action:@selector(TxCHideUiButtonPressed:)];

// dispatch_async(dispatch_get_main_queue(), ^{
// [self TxCStatusIntHiddenTikTok];
// });
//  }

// }
// %new
// - (void)TxCHideUiButtonPressed:(UIButton *)sender {
// if(!TxCTikTokHiddenInt){
// TxCTikTokHiddenInt = YES;
// } else {
// TxCTikTokHiddenInt = NO;
// }
// [self TxCStatusIntHiddenTikTok];
// }

// %new
// - (void)TxCStatusIntHiddenTikTok{

// AWEPlayInteractionContext *interactionContext = [[self.viewController valueForKey:@"_interactionContext"] valueForKey:@"_interactionViewIfLoaded"];
// interactionContext.hidden = TxCTikTokHiddenInt;
// }

// %new
// - (void)CopyUser:(UIButton *)sender {
//     if ([self.viewController isKindOfClass:%c(TTKStoryDetailContainerViewController)]) {
// dispatch_async(dispatch_get_main_queue(), ^{
// NSString *UsernameProfile   = [[[self.viewController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_customID"];
// NSString *SignatureProfile  = [[[self.viewController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_signature"];
// NSString *NicknameProfile   = [[[self.viewController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_nickname"];
// NSString *BioUrlProfile     = [[[self.viewController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_bioUrl"];
// NSArray *originURLList      = [[[[self.viewController valueForKey:@"_model"] valueForKey:@"_author"] valueForKey:@"_avatarThumb"] valueForKey:@"_originURLList"];
// NSString *ProfileImage      = [originURLList firstObject];

// [TxCManagerHelper TxCDataProfile:@"TikTok" Username:UsernameProfile FullName:NicknameProfile Bio:[[self.viewController valueForKey:@"_model"] valueForKey:@"_descriptionString"] BioLink:BioUrlProfile ProfileImage:ProfileImage];


// });

//     }
// }
// %new
// - (void)AFSocialButtonTikTok:(UIButton *)sender {
// dispatch_async(dispatch_get_main_queue(), ^{
// if ([self.viewController isKindOfClass:%c(TTKStoryDetailContainerViewController)]) {
// NSURL * directURL = [NSURL URLWithString:self.model.video.playURL.originURLList.firstObject];
// NSString* title = [[directURL lastPathComponent] stringByDeletingPathExtension];
// NSString * pathSave = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mp4", [directURL lastPathComponent]]];
// [TxCManagerHelper TxCManagerDownloadingMediaWithPath:directURL Path:pathSave];
// }
// });
// }
// %end 

// Auto Play Image Silder
%hook AWEPlayPhotoAlbumViewController
- (BOOL)p_shouldDisableAutoplay{
if([TxCManagerHelper TxCGetSettings:@"AUTO_PLAY_IMAGE_SILDER_TIKTOK"]){
return FALSE;
} else{
return TRUE;
}
}
%end 




// auto play next video and stop looping video
%hook AWEPlayVideoPlayerController 
- (void)playerWillLoopPlaying:(id)arg1 {
if([TxCManagerHelper TxCGetSettings:@"AUTOPLAY_VIDEO_TIKTOK"]){
        if ([self.container.parentViewController isKindOfClass:%c(AWENewFeedTableViewController)]) {
            [((AWENewFeedTableViewController *)self.container.parentViewController) scrollToNextVideo];
            return;
        }
    }
    %orig;
}
%end

// @interface AWENewAwemeDetailTableViewController : UIViewController
// @property (nonatomic, assign, readonly) AWEAwemeModel *currentDisplayingAweme;
// @property (nonatomic, strong, readwrite) AWEAwemeModel *currentPlayingStory;
// @end 

// %hook AWENewAwemeDetailTableViewController
// - (id)initWithConfiguration:(id)arg1{
//     dispatch_async(dispatch_get_main_queue(), ^{
// UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"AFSocial 2"
// message:@"initWithConfiguration"
// preferredStyle:UIAlertControllerStyleAlert];

// UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK, Thx" style:UIAlertActionStyleDefault
// handler:^(UIAlertAction * action) {
// }];

// [alert addAction:defaultAction];
// [TxCShowView() presentViewController:alert animated:YES completion:nil];
// });
// return %orig;
// }
// %end 
%end 
%ctor{
if(BUNDLEIDEQUALS(@"com.zhiliaoapp.musically")){
%init(HooksTikTokMediaVideo);
}
}