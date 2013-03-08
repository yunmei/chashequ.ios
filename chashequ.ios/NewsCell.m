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
        self.contentView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:247/255.0];
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
        newsTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 220, 40)];
        [newsTitleLabel setFont:[UIFont systemFontOfSize:16.0]];
        [newsTitleLabel setBackgroundColor:[UIColor clearColor]];
    }
    return newsTitleLabel;
}

- (UILabel *)newsFromLabel
{
    if (newsFromLabel == nil) {
        newsFromLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 45, 60, 30)];
        [newsFromLabel setFont:[UIFont systemFontOfSize:12.0]];
        newsFromLabel.textColor = [UIColor grayColor];
        [newsFromLabel setBackgroundColor:[UIColor clearColor]];
    }
    return newsFromLabel;
}

- (UILabel *)newsAuthorLabel
{
    if (newsAuthorLabel == nil) {
        newsAuthorLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 45, 80, 30)];
        [newsAuthorLabel setFont:[UIFont systemFontOfSize:12.0]];
        newsAuthorLabel.textColor = [UIColor grayColor];
        [newsAuthorLabel setBackgroundColor:[UIColor clearColor]];
    }
    return newsAuthorLabel;
}

- (UILabel *)newsTimeLabel
{
    if (newsTimeLabel == nil) {
        newsTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(145, 45, 80, 30)];
        [newsTimeLabel setFont:[UIFont systemFontOfSize:12.0]];
        newsTimeLabel.textColor = [UIColor grayColor];
        [newsTimeLabel setBackgroundColor:[UIColor clearColor]];
    }
    return newsTimeLabel;
}

- (UIImageView *)newsImageView
{
    if (newsImageView == nil) {
        newsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(230, 10, 80, 60)];
    }
    return newsImageView;
}
@end
