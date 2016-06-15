//
//  KTAwesomeSizingCell.m
//  CenterFlow
//
//  Created by Kyle Truscott on 5/4/16.
//  Copyright © 2016 keighl. All rights reserved.
//

#import "KTAwesomeSizingCell.h"

@implementation KTAwesomeSizingCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.clipsToBounds = NO;
        self.contentView.clipsToBounds = NO;
        
        self.contentView.layer.borderColor = [UIColor blueColor].CGColor;
        self.contentView.layer.borderWidth = 1.f;
        
        self.label = [UILabel new];
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        self.label.font = [UIFont systemFontOfSize:14];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textColor = [UIColor blueColor];
        self.label.preferredMaxLayoutWidth = 100;
        [self.contentView addSubview:self.label];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_label);
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_label]-10-|" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[_label]-10-|" options:0 metrics:nil views:views]];
        
    }
    
    return self;
}

@end
