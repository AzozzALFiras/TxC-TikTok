#import "../../AFSocialRootViewController.h"
#import "TikTok.h"

%group HooksTikTokSettings
%hook AWESettingsNormalSectionViewModel
- (void)viewDidLoad {
    %orig;
    if ([self.sectionIdentifier isEqualToString:@"account"]) {
        TTKSettingsBaseCellPlugin *TxCTikTokSettingsPluginCell = [[%c(TTKSettingsBaseCellPlugin) alloc] initWithPluginContext:self.context];

        AWESettingItemModel *TxCTikTokSettingsItemModel = [[%c(AWESettingItemModel) alloc] initWithIdentifier:@"TikTokTxC_settings"];
        [TxCTikTokSettingsItemModel setTitle:@"TikTokTxC Settings"];
        [TxCTikTokSettingsItemModel setDetail:@"TikTokTxC Settings"];
        [TxCTikTokSettingsItemModel setIconImage:[UIImage systemImageNamed:@"gear"]];
        [TxCTikTokSettingsItemModel setType:99];

        [TxCTikTokSettingsPluginCell setItemModel:TxCTikTokSettingsItemModel];

        [self insertModel:TxCTikTokSettingsPluginCell atIndex:0 animated:true];
    }
}
%end

%hook TTKSettingsBaseCellPlugin
- (void)didSelectItemAtIndex:(NSInteger)index {
    if ([self.itemModel.identifier isEqualToString:@"TikTokTxC_settings"]) {
        UINavigationController *TikTokTxCSettings = [[UINavigationController alloc] initWithRootViewController:[[AFSocialRootViewController alloc] init]];
        [TxCShowView() presentViewController:TikTokTxCSettings animated:true completion:nil];
    } else {
        return %orig;
    }
}
%end
%end 
%ctor{
%init(HooksTikTokSettings);
}