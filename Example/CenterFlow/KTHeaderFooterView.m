//
//  KTHeaderFooterView.m
//  CenterFlow
//
//  Created by Kyle Truscott on 6/14/16.
//  Copyright © 2016 keighl. All rights reserved.
//

#import "KTHeaderFooterView.h"

@implementation KTHeaderFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
        
        self.label = [UILabel new];
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        self.label.font = [UIFont systemFontOfSize:14];
        self.label.backgroundColor = [UIColor clearColor];        
        self.label.preferredMaxLayoutWidth = 100;
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_label);
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_label]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_label]|" options:0 metrics:nil views:views]];
    }
    
    return self;
}


@end
