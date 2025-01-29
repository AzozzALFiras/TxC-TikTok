#import "TikTok.h"

%group HooksTikTokAccount 

%hook TIKTOKUserDetailViewController

%property (strong, nonatomic) UIButton *AFSoicalButtonTikTok;
%property (strong, nonatomic) UILabel *AFSocialFollowStatus;
%property (strong, nonatomic) UILabel *AFSocialVideoCount;

- (void)setIsViewAlreadyAppeared:(BOOL)arg1 {
    %orig;
    
    if ([TxCManagerHelper TxCGetSettings:@"SHOW_DATA_USER_TIKTOK"]) {
        self.AFSoicalButtonTikTok = [UIButton buttonWithType:UIButtonTypeContactAdd];
        self.AFSoicalButtonTikTok.tag = 482;
        [self.AFSoicalButtonTikTok addTarget:self action:@selector(TxCCopyProfileData) forControlEvents:UIControlEventTouchUpInside];
        [self.AFSoicalButtonTikTok setImage:[TxCManagerHelper TxCImage:@"doc.on.clipboard"] forState:UIControlStateNormal];
        
        @try {
            [self.AFSoicalButtonTikTok setTintColor:[UIColor labelColor]];
        } @catch (NSException *e) {}
        
        self.AFSoicalButtonTikTok.frame = CGRectMake(self.view.frame.size.width - 45, 250.0, 30.0, 30.0);
        [self.view addSubview:self.AFSoicalButtonTikTok];
    }
    
    if ([TxCManagerHelper TxCGetSettings:@"SHOW_FOLLOW_STATUS_TIKTOK"]) {
        self.AFSocialFollowStatus = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 150, 20)];
        self.AFSocialFollowStatus.text = self.user.followerStatus ? @"Following You...!" : @"Not Following You...!";
        self.AFSocialFollowStatus.textColor = [UIColor whiteColor];
        self.AFSocialFollowStatus.textAlignment = NSTextAlignmentCenter;
        self.AFSocialFollowStatus.backgroundColor = self.user.followerStatus ? [UIColor colorWithRed:0.00 green:0.42 blue:0.46 alpha:1.00] : [UIColor colorWithRed:0.72 green:0.00 blue:0.00 alpha:1.00];
        self.AFSocialFollowStatus.layer.cornerRadius = 2;
        self.AFSocialFollowStatus.clipsToBounds = YES;
        self.AFSocialFollowStatus.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:16.0];
        [self.view addSubview:self.AFSocialFollowStatus];
    }
    
    if ([TxCManagerHelper TxCGetSettings:@"VIDEO_COUNTS_TIKTOK"]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [NSThread sleepForTimeInterval:0.10];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.AFSocialVideoCount = [[UILabel alloc] initWithFrame:CGRectMake(10, 115, 150, 20)];
                self.AFSocialVideoCount.text = [NSString stringWithFormat:@"Videos : %@", self.user.awemeCount];
                self.AFSocialVideoCount.textColor = [UIColor whiteColor];
                self.AFSocialVideoCount.textAlignment = NSTextAlignmentCenter;
                self.AFSocialVideoCount.backgroundColor = [UIColor colorWithRed:0.00 green:0.42 blue:0.46 alpha:1.00];
                self.AFSocialVideoCount.layer.cornerRadius = 2;
                self.AFSocialVideoCount.clipsToBounds = YES;
                self.AFSocialVideoCount.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:16.0];
                [self.view addSubview:self.AFSocialVideoCount];
            });
        });
    }
}

%new
- (void)TxCCopyProfileData {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *UsernameProfile = self.user.customID;
        NSString *NicknameProfile = self.user.nickname;
        NSString *SignatureProfile = self.user.signature;
        NSString *BioUrlProfile = self.user.bioUrl;
        NSArray *originURLList = [[[self valueForKey:@"_user"] valueForKey:@"_avatarThumb"] valueForKey:@"_originURLList"];
        NSString *ProfileImage = [originURLList firstObject];
        
        [TxCManagerHelper TxCDataProfile:@"TikTok" Username:UsernameProfile FullName:NicknameProfile Bio:SignatureProfile BioLink:BioUrlProfile ProfileImage:ProfileImage];
    });
}

%hook TIKTOKProfileHeaderViewController
- (void)configWithUser:(id)arg1 {
    %orig;
    
    if ([TxCManagerHelper TxCGetSettings:@"SHOW_FULL_PRIFILE_DATA_TIKTOK"]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [NSThread sleepForTimeInterval:0.10];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                
                UILabel *FollowerCountLabel = [[self.view valueForKey:@"socialStatisticView"] valueForKey:@"_fanCountLabel"];
                FollowerCountLabel.text = [formatter stringFromNumber:@(self.user.followerCount.stringValue.integerValue)];
                
                UILabel *FollowingCountLabel = [[self.view valueForKey:@"socialStatisticView"] valueForKey:@"_followingCountLabel"];
                FollowingCountLabel.text = [formatter stringFromNumber:@(self.user.followingCount.stringValue.integerValue)];
                
                UILabel *PraiseCountLabel = [[self.view valueForKey:@"socialStatisticView"] valueForKey:@"_praiseCountLabel"];
                PraiseCountLabel.text = [formatter stringFromNumber:@(self.user.favoritedCount.stringValue.integerValue)];
            });
        });
    }
}
%end 

%end 

%ctor {
    if (BUNDLEIDEQUALS(@"com.zhiliaoapp.musically")) {
        %init(HooksTikTokAccount);
    }
}
