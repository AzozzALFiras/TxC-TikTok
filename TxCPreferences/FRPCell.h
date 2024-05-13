//
//  FRPCell.h
//  TxCPreferences
//
//  Created by Fouad Raheb on 7/2/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "TxCPreferences.h"
#import "FRPSettings.h"

typedef void (^FRPValueChanged)(id sender);

@interface FRPCell : UITableViewCell

+ (instancetype)cellWithTitle:(NSString *)title subTitle:(NSString *)subTitle setting:(FRPSettings *)setting;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle setting:(FRPSettings *)setting;

+ (instancetype)cellWithTitle:(NSString *)title setting:(FRPSettings *)setting;
- (instancetype)initWithTitle:(NSString *)title setting:(FRPSettings *)setting;

@property (nonatomic, strong) UIColor *tintUIColor;

@property (nonatomic, strong) FRPSettings *setting;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *postNotification;

@property (nonatomic, copy) FRPValueChanged valueChanged;

@property (nonatomic, assign) int height;

- (void)didSelectFromTable:(TxCPreferences *)viewController;

@end
