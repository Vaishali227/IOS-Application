//
//  DataTableViewCell.m
//  Test
//
//  Created by MaulikVaishali on 22/02/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

#import "DataTableViewCell.h"

@implementation DataTableViewCell
@synthesize lbltitle,lbldescription,imglogo;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
