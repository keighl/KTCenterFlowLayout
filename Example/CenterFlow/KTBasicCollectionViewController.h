//
//  MainController.h
//  CenterFlow
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTAwesomeCell.h"

@interface KTBasicCollectionViewController : UICollectionViewController
@property (strong) NSArray *states;
@property (strong) KTAwesomeCell *sizingCell;
@end
