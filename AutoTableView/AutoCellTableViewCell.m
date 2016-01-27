//
//  AutoCellTableViewCell.m
//  AutoTableView
//
//  Created by 郭顺 on 15/8/11.
//  Copyright (c) 2015年 hnzdkj. All rights reserved.
//

#import "AutoCellTableViewCell.h"

@interface AutoCellTableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation AutoCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textLable = [[UILabel alloc]init];
        _textLable.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_textLable];
        _textLable.numberOfLines = 0;
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:_textLable attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:_textLable attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
        NSLayoutConstraint *Top = [NSLayoutConstraint constraintWithItem:_textLable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:6];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_textLable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8];
        [self.contentView addConstraints:@[left,right,Top,bottom]];
    }
    return self;
}

- (void)setModel:(NSDictionary *)model{
    _model = model;
    NSString *text = [model objectForKey:@"text"];
    _textLable.text = text;
}

- (void)updateConstraints
{

    
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct 
}

@end
