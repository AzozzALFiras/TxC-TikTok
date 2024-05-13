//
//  FRPLinkCell.m
//  TxCPreferences
//
//  Created by Fouad Raheb on 7/2/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPLinkCell.h"

@interface FRPLinkCell ()
@end

@implementation FRPLinkCell

+ (instancetype)cellWithTitle:(NSString *)title image:(UIImage *)image subTitle:(NSString *)subTitle selectedBlock:(FRPLinkCellSelected)block {
return [[self alloc] cellWithTitle:title image:image subTitle:subTitle selectedBlock:block];
}

- (instancetype)cellWithTitle:(NSString *)title image:(UIImage *)image subTitle:(NSString *)subTitle selectedBlock:(FRPLinkCellSelected)block {
FRPLinkCell *cell = [super initWithTitle:title  subTitle:subTitle setting:nil];
cell.image = image;
cell.valueChanged = block;
cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

CGSize size = CGSizeMake(35,35);
UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
[self.image drawInRect:CGRectMake(0, 0, size.width, size.height)];
UIImage *newThumbnail = UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();
cell.imageView.image = newThumbnail;;
 
return cell;
}

- (void)didSelectFromTable:(TxCPreferences *)viewController {
NSIndexPath *indexPath = [viewController.tableView indexPathForCell:self];
[viewController.tableView deselectRowAtIndexPath:indexPath animated:YES];
if (self.valueChanged) {
self.valueChanged(self);
}
}

- (void)layoutSubviews {
[super layoutSubviews];
self.imageView.layer.cornerRadius = 5;
self.imageView.clipsToBounds = YES;
}

@end
