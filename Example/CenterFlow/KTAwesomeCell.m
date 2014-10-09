//
//  AwesomeCell.m
//  CenterFlow
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import "KTAwesomeCell.h"
#import "KTUtil.h"
#import "UIView+KTExtras.h"

@implementation KTAwesomeCell

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  
  if (self)
  {
    self.clipsToBounds = NO;
    self.contentView.clipsToBounds = NO;
    
    self.label = [KTEdgeLabel new];
    self.label.font = [UIFont fontWithName:@"HelveticaNeue" size:14.f];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textColor = [UIColor blueColor];
    self.label.clipsToBounds = NO;
    self.label.layer.borderColor = [UIColor blueColor].CGColor;
    self.label.layer.borderWidth = 1.f;
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    self.label.edgeInsets = UIEdgeInsetsMake(5, 15, 5, 15);
    [self.contentView addSubview:self.label];
    
    // Autolayout
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_label);
    
    [self.contentView addConstraints:[KTUtil visualConstraints:@"|[_label]|" views:views]];
    [self.contentView addConstraints:[KTUtil visualConstraints:@"V:|[_label]|" views:views]];
  
  }
  
  return self;
}

- (CGSize)intrinsicContentSize
{
  return self.label.intrinsicContentSize;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
}

@end
