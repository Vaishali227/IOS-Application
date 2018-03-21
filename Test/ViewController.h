//
//  ViewController.h
//  Test
//
//  Created by MaulikVaishali on 22/02/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tblpublishdata;
     NSString *strtitle,*strimg,*strid,*strController;

    BOOL isfrompublish;
    NSMutableArray *arrData;
    NSInteger offset;
}

@end

