//
//  FRPCell.m
//  TxCPreferences
//
//  Created by Fouad Raheb on 7/2/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPCell.h"

#define rgbValue
#define UIColorFromHEX(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation FRPCell
+ (instancetype)cellWithTitle:(NSString *)title subTitle:(NSString *)subTitle setting:(FRPSettings *)setting {
return [[self alloc] initWithTitle:title subTitle:subTitle setting:setting];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle setting:(FRPSettings *)setting {
if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil]) {
self.clipsToBounds = YES;
self.textLabel.text = title;
self.textLabel.numberOfLines = 2;
self.detailTextLabel.text = subTitle;
self.detailTextLabel.textColor = UIColorFromHEX(0x808080);
self.detailTextLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(12.0)];
self.detailTextLabel.numberOfLines = 3;
self.detailTextLabel.minimumScaleFactor = 0.01;
self.detailTextLabel.adjustsFontSizeToFitWidth = YES;
self.setting = setting;
}
return self;
}

+ (instancetype)cellWithTitle:(NSString *)title setting:(FRPSettings *)setting {
return [[self alloc] initWithTitle:title setting:setting];
}

- (instancetype)initWithTitle:(NSString *)title setting:(FRPSettings *)setting {
if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil]) {
self.clipsToBounds = YES;
self.textLabel.text = title;
self.setting = setting;
}
return self;
}

- (void)didSelectFromTable:(TxCPreferences *)viewController {
//    NSIndexPath *indexPath = [viewController.tableView indexPathForCell:self];
//    NSLog(@"Did Select Cell At Index: %@",indexPath);
}

@end
