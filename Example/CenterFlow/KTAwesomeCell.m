//
//  AwesomeCell.m
//  CenterFlow
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import "KTAwesomeCell.h"

@implementation KTAwesomeCell

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
        [self.contentView addSubview:self.label];
      
        NSDictionary *views = NSDictionaryOfVariableBindings(_label);

        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_label]" options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[_label]" options:0 metrics:nil views:views]];
      
    }
  
    return self;
}

- (CGSize)intrinsicContentSize
{
    CGSize size = self.label.intrinsicContentSize;
    size.width += 20;
    size.height += 20;
    return size;
}

@end
