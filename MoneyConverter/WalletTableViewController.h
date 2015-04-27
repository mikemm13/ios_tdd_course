//
//  WalletTableViewController.h
//  MoneyConverter
//
//  Created by Miguel Martin on 27/4/15.
//  Copyright (c) 2015 Miguel Martín-Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Wallet;

@interface WalletTableViewController : UITableViewController

- (id)initWithModel:(Wallet *)model;

@end
