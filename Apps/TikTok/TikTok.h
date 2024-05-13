
//  Created by Azozz ALFiras on 5/7/22.
//


#import <objc/runtime.h>
#import <substrate.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include "../../interface/TxCManagerHelper.h"
#import "../../TxCLibrary/azfencrpt.h"
#import "../../TxCLibrary/Base64.h"
#import "../../TxCLibrary/NSData+CommonCrypto.h"
#import "../../TxCLibrary/i7Miesho.h"


#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#pragma clang diagnostic ignored "-Wnullability-completeness"
#pragma GCC diagnostic ignored "-Wunused-property-ivar"




// ######  Start  Class TikTok   ######

@interface AWEButton : UIButton
@end

@interface AWEFeedVideoButton : AWEButton
@property(retain, nonatomic) UIImageView* aweImageView;
@property(retain, nonatomic) UIView* containerView;
@property(copy, nonatomic) void (^touchUpInsideBlock)(void);
+ (id)noTextButtonWithImageName:(NSString*)name shouldFit:(BOOL)shouldFit;
- (void)setImage:(UIImage*)image;
@end

@interface AWEMusicCoverButton : AWEButton
@end

@interface AWEURLModel : NSObject
@property(retain, nonatomic) NSArray* originURLList;
@end

@interface AWEVideoModel : NSObject
@property(readonly, nonatomic) AWEURLModel* playURL;
@property(readonly, nonatomic) AWEURLModel* downloadURL;
@property(readonly, nonatomic) NSNumber *duration;
@end


@interface AWEMusicModel : NSObject
@property(readonly, nonatomic) AWEURLModel* playURL;
@property(retain, nonatomic) NSString* ownerHandle;
@end

@interface AWEUserModel : NSObject
@property(readonly, nonatomic) NSString *customID; // Username
@property(readonly, nonatomic) NSString *signature; // Bio
@property(readonly, nonatomic) NSString *nickname; // NickName
@property(readonly, nonatomic) NSString *bioUrl; // Link Bio
@property(readonly, nonatomic) NSNumber *awemeCount; // Count Videe
@property (nonatomic, strong, readwrite) NSNumber *praiseCount;
@property (nonatomic, strong, readwrite) NSNumber *favoritedCount;
@property (nonatomic, strong, readwrite) NSNumber *followingCount;
@property (nonatomic, strong, readwrite) NSNumber *followerCount;
@property(readonly, nonatomic) AWEURLModel* avatarThumb;
@property(readonly, nonatomic) int followStatus; // Follow Status
@property(readonly, nonatomic) int followerStatus; // Follower Status
@end



@interface AWEPlayVideoViewController : UIViewController
- (void)setPlayerSeekTime:(double)arg1 completion:(id)arg2;
@end


@interface AWEAwemeModel : NSObject
@property(nonatomic) BOOL isAds;
@property(retain, nonatomic) AWEVideoModel* video;
@property(retain, nonatomic) AWEMusicModel* music;
@property(retain, nonatomic) AWEUserModel* author;
@property(retain, nonatomic) NSString* descriptionString;
@property(retain, nonatomic) NSString* region;

@end

@interface AWEFeedContainerViewController : UIViewController
@property (nonatomic, readonly) UIView *searchEntranceView;
@property (nonatomic, readonly) UIView *MTLiveEntranceView;
@property (nonatomic, readonly) UIView *tabControl;
@property (nonatomic, readonly) UIView *specialEventEntranceView;
@property(retain, nonatomic) UIView *passthroughStackView;
- (void)setAccessoriesHidden:(BOOL)arg1;
@property (readonly, class) AWEFeedContainerViewController *ShareUIUnHidden; // new
@property (nonatomic) BOOL AFSocialUIHidden; // new property
- (void)setHide:(BOOL)arg1;

@end

@interface AWEAwemePlayVideoViewController : AWEPlayVideoViewController
@end

@interface AWEAwemePlayInteractionViewController : UIViewController
@property(retain, nonatomic) AWEFeedVideoButton* likeButton;
@property(retain, nonatomic) AWEFeedVideoButton* shareButton;
@property(retain, nonatomic) AWEMusicCoverButton* musicButton;
@property(retain, nonatomic) AWEAwemeModel* model;
@property (strong) UIButton *AFSoicalButtonTikTok;
@property(nonatomic) AWEAwemePlayVideoViewController *videoDelegate;
@property(nonatomic, retain) UISlider *slider; // new property
@property(nonatomic, retain) NSTimer *sliderTimer; // new property

- (void)setHide:(BOOL)arg1;
- (void)onSliderValChanged:(UISlider *)slider forEvent:(UIEvent *)event; // new
- (void)downloadButtonPressed;
- (void)Shared;
- (void)azflibrary;
@end

@interface AWEFeedTableViewController : UIViewController
- (void)scrollToNextVideo;
@end

@interface AWEPlayInteractionBaseElement : NSObject
@end

@interface AWEPlayInteractionElementContainer : NSObject
@property (readonly) NSArray<__kindof AWEPlayInteractionBaseElement *> *elementArray;
@property (readonly) UIStackView *containerView;
@end

@interface AWEPlayInteractionViewController : UIViewController
@property AWEAwemeModel *model;
@property (strong) UIButton *AFSoicalButtonTikTok;
@property (strong) UIButton *AFSocialUIHiddenButton;
@property (strong) UIButton *AFSocialCopyButton;
@property (strong) UILabel *AFSocialRegion;
@property (readonly) AWEPlayInteractionElementContainer *rightContainer;
- (void)setHide:(BOOL)arg1;
- (void)AFSocialUpdatedShowUI; // new
- (id)region;
@end




@interface AWEPlayInteractionContext
@property (nonatomic, assign, readwrite, getter = isHidden) BOOL hidden;
@property (nonatomic, weak, readwrite) UIView *interactionViewIfLoaded;
@end

@interface AWEAwemeBaseViewController : UIViewController
@end

@interface AWEFeedCellViewController : AWEAwemeBaseViewController
@property(retain, nonatomic) AWEAwemeModel *model;
@property(nonatomic, retain) UIButton *AFSoicalButtonTikTok; // new property
@property(nonatomic, retain) UIButton *AFSocialCopyButton; // new property
@property(nonatomic, retain) UIButton *AFSocialUIHiddenButton; // new property
@property(retain, nonatomic) UIView *tabControl;
@property (nonatomic, retain) UILabel *TxCCounterCity;
@property(retain, nonatomic) UIView *specialEventEntranceView;
- (void)TxCStatusIntHiddenTikTok;
- (void)setHide:(BOOL)arg1;
@end


@interface AWEPlayVideoPlayerController : NSObject
@property(nonatomic) AWEFeedCellViewController *container;
- (void)setPlayerSeekTime:(double)arg1 completion:(id)arg2;
@end



@interface AWENewFeedTableViewController : UIViewController
@property (nonatomic, assign, readonly) AWEAwemeModel *currentAweme;
@property (strong) UIButton *AFSoicalButtonTikTok;
@property (strong) UIButton *AFSocialUIHiddenButton;
@property (strong) UIButton *AFSocialCopyButton;
@property (strong) UILabel *AFSocialRegion;
@property (readonly) AWEPlayInteractionElementContainer *rightContainer;
- (void)setHidden:(BOOL)arg1;
- (void)scrollToNextVideo;
- (void)setAccessoriesHidden:(BOOL)arg1;
- (void)AFSocialUpdatedShowUI; // new
- (id)region;
// + (AWENewFeedTableViewController *)sharedInstance; // new
@property(retain, nonatomic) UIView *tabControl;
@property(retain, nonatomic) UIView *specialEventEntranceView;
- (void)TxCStatusIntHiddenTikTok;
@end


@interface TIKTOKUserDetailViewController : UIViewController
@property (strong) UIButton *AFSoicalButtonTikTok;
@property (nonatomic, assign, readonly) AWEUserModel *user;
@property (nonatomic, retain) UILabel *AFSocialFollowStatus;
@property (nonatomic, retain) UILabel *AFSocialVideoCount;
@end


@interface TIKTOKProfileHeaderViewController : UIViewController
@property (nonatomic, assign, readonly) AWEUserModel *user;
@end

@interface TIKTOKProfileHeaderView : UIView
@property (nonatomic, assign, readonly) AWEUserModel *user;
@end



@interface AWEAwemeDetailCellViewController : UIViewController
@property(retain, nonatomic) AWEAwemeModel *model;
@property(nonatomic, retain) UIButton *AFSoicalButtonTikTok; // new property
@property(nonatomic, retain) UIButton *AFSocialCopyButton; // new property
@property (nonatomic, retain) UIButton *AFSocialUIHiddenButton;
@property (nonatomic, retain) UILabel *TxCCounterCity;
- (void)setHide:(BOOL)arg1;
- (void)setHidden:(BOOL)arg1;
- (void)setAccessoriesHidden:(BOOL)arg1;
- (void)updateShowOrHideUI; // new
- (void)TxCStatusIntHiddenTikTok;
@end


@interface TTKStoryDetailTableViewCell : UITableViewCell
@property(nonatomic, strong, readwrite) UIViewController *viewController;
@property(nonatomic, strong, readwrite) UIViewController *parentVC;
@property(retain, nonatomic) AWEAwemeModel *model;
@property(nonatomic, retain) UIButton *AFSoicalButtonTikTok; // new property
@property(nonatomic, retain) UIButton *AFSocialCopyButton; // new property
@property (nonatomic, retain) UIButton *AFSocialUIHiddenButton;
@property (nonatomic, retain) UILabel *TxCCounterCity;
- (void)setHide:(BOOL)arg1;
- (void)setHidden:(BOOL)arg1;
- (void)setAccessoriesHidden:(BOOL)arg1;
- (void)updateShowOrHideUI; // new
- (void)TxCStatusIntHiddenTikTok;
@end 

@interface AWESettingItemModel: NSObject
@property(nonatomic, copy, readwrite) NSString *identifier;
@property(nonatomic, copy, readwrite) NSString *title;
@property(nonatomic, copy, readwrite) NSString *detail;
@property(nonatomic, strong, readwrite) UIImage *iconImage;
@property(nonatomic, assign, readwrite) NSUInteger type;
- (instancetype)initWithIdentifier:(NSString *)identifier;
@end

@interface TTKSettingsBaseCellPlugin: NSObject
@property(nonatomic, weak, readwrite) id context;
@property(nonatomic, strong, readwrite) AWESettingItemModel *itemModel;
- (instancetype)initWithPluginContext:(id)context;
@end

@interface AWEBaseListSectionViewModel: NSObject
@property(nonatomic, copy, readwrite) NSArray *modelsArray;
- (void)insertModel:(id)model atIndex:(NSInteger)index animated:(bool)animated;
@end

@interface AWESettingsNormalSectionViewModel: AWEBaseListSectionViewModel
@property(nonatomic, weak, readwrite) id context;
@property(nonatomic, copy, readwrite) NSString *sectionHeaderTitle;
@property(nonatomic, copy, readwrite) NSString *sectionIdentifier;
@end
