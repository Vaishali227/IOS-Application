//
//  DataTableViewCell.h
//  Test
//
//  Created by MaulikVaishali on 22/02/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableViewCell : UITableViewCell
@property(nonatomic,retain)IBOutlet UILabel *lbltitle;
@property(nonatomic,retain)IBOutlet UILabel *lbldescription;
@property(nonatomic,retain)IBOutlet UIImageView *imglogo;
@end
