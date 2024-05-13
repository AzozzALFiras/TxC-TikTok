//
//  TxCPreferences.h
//  TxCPreferences
//
//  Created by Azozz ALFiras on 1/2/22.
//  Copyright (c) 2022 Azozz ALFiras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TxCPreferences : UITableViewController

@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSString *plistPath;

+ (instancetype)tableWithSections:(NSArray *)sections title:(NSString *)title tintColor:(UIColor *)color;

@end
