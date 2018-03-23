//
//  ViewController.h
//  Demo
//
//  Created by MaulikVaishali on 22/03/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
 
    NSArray *arrmalecat;
    NSArray *arrfemalecat;
    
    
    IBOutlet UITableView *tbldata;
}

@end

