//
//  TxCPreferences.m
//  TxCPreferences
//
//  Created by Fouad Raheb on 7/2/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "TxCPreferences.h"
#import "FRPCell.h"
#import "FRPSection.h"

@interface TxCPreferences ()

@property (nonatomic, strong) UIColor *tintUIColor;

@end

@implementation TxCPreferences
- (UITableViewStyle)tableViewStyle {
if (@available(iOS 13.0, *)) {
return UITableViewStyleInsetGrouped;
} else {
return UITableViewStylePlain;
}
}

- (BOOL)_isRegularWidth {
return NO;
}
+ (instancetype)tableWithSections:(NSArray *)sections title:(NSString *)title tintColor:(UIColor *)color {
TxCPreferences *table = [[self alloc] initTableWithSections:sections];
table.title = title;
table.tintUIColor = color;
return table;
}

- (instancetype)initTableWithSections:(NSArray *)sections {
if (@available(iOS 13.0, *)) {
if (self = [super initWithStyle:UITableViewStyleInsetGrouped]) {
self.sections = sections;
}
return self;
} else {
if (self = [super initWithStyle:UITableViewStyleGrouped]) {
self.sections = sections;
}
return self;

}
}

- (void)updateTintColors {
UIColor *tintUIColor = self.tintUIColor;
for (FRPSection *section in self.sections) {
for (FRPCell *cell in section.cells) {
cell.tintUIColor = tintUIColor;
if ([self.plistPath length] > 0 && cell.setting) {
    cell.setting.fileSave = self.plistPath;
}
}
section.tintUIColor = tintUIColor;
}
self.view.tintColor = tintUIColor;
self.tableView.tintColor = tintUIColor;
}

- (void)viewDidDisappear:(BOOL)animated {
[super viewDidDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated {
[super viewWillAppear:animated];
[self updateTintColors];


NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];

if (selectedRowIndexPath) {
[self.tableView deselectRowAtIndexPath:selectedRowIndexPath animated:YES];

[[self.navigationController transitionCoordinator] notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context) {
if ([context isCancelled]) {
    [self.tableView selectRowAtIndexPath:selectedRowIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}
}];
}
}

- (FRPCell *)cellForIndexPath:(NSIndexPath *)indexPath {
return [self.sections[indexPath.section] cells][indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
return self.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
return [self.sections[section] headerTitle];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
FRPSection *section = self.sections[sectionIndex];

return section.cells.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
FRPCell *cell = [self cellForIndexPath:indexPath];

return (cell.height > 0)?cell.height:UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
FRPCell *cell = [self cellForIndexPath:indexPath];

return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
FRPCell *cell = [self cellForIndexPath:indexPath];
if ([cell respondsToSelector:@selector(didSelectFromTable:)]) [cell didSelectFromTable:self];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
return [self.sections[section] footerTitle];
}

@end
