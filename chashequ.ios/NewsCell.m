//
//  NewsCell.m
//  chashequ.ios
//
//  Created by bevin chen on 13-3-7.
//  Copyright (c) 2013年 maimaicha. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

@synthesize newsImageView;
@synthesize newsTitleLabel;
@synthesize newsFromLabel;
@synthesize newsTimeLabel;
@synthesize newsAuthorLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)newsTitleLabel
{
    if (newsTitleLabel == nil) {
        newsTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        [newsTitleLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return newsTitleLabel;
}

- (UILabel *)newsFromLabel
{
    if (newsFromLabel == nil) {
        newsFromLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 80, 30)];
        [newsFromLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return newsFromLabel;
}

- (UILabel *)newsAuthorLabel
{
    if (newsAuthorLabel == nil) {
        newsAuthorLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 30, 40, 30)];
        [newsAuthorLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return newsAuthorLabel;
}

- (UILabel *)newsTimeLabel
{
    if (newsTimeLabel == nil) {
        newsTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 30, 40, 30)];
        [newsTimeLabel setFont:[UIFont systemFontOfSize:13.0]];
    }
    return newsTimeLabel;
}

- (UIImageView *)newsImageView
{
    if (newsImageView == nil) {
        newsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 5, 152, 114)];
    }
    return newsImageView;
}
@end
