//
//  ViewController.m
//  Demo
//
//  Created by MaulikVaishali on 22/03/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

#import "ViewController.h"
#import "Utility.h"
#import "MBProgressHUD.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getdata];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)getdata
{
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [Utility getRequest:nil :@"people.json" complitionblock:^(id result) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSMutableArray *arrdata =[[NSMutableArray alloc]init];
        NSMutableArray *arrmale = [[NSMutableArray alloc]init];
        NSMutableArray *arrfemale = [[NSMutableArray alloc]init];
        NSMutableArray *arrmalecatdata = [[NSMutableArray alloc]init];
        NSMutableArray *arrfemalecatdata = [[NSMutableArray alloc]init];
        arrmalecat = [[NSArray alloc]init];
        arrfemalecat = [[NSArray alloc]init];
        
        arrdata = [result mutableCopy];
        for (int i = 0; i < [arrdata count]; i++)
        {
            if([arrdata[i][@"gender"]  isEqualToString: @"Male"])
            {
                [arrmale addObject:arrdata[i][@"pets"]];
              
            }
            else
            {
                [arrfemale addObject:arrdata[i][@"pets"]];
            }
            
        }
        

         [arrmale removeObjectIdenticalTo:[NSNull null]];
        
        for (int j = 0; j < [arrmale count]; j++)
        {
            NSMutableArray *tempary = [[NSMutableArray alloc]init];
            tempary = arrmale[j];
   
            for(int k = 0 ; k < [tempary count] ; k++)
            {
               if([tempary[k][@"type"] isEqualToString:@"Cat"])
               {
                   [arrmalecatdata addObject:tempary[k][@"name"]];
               }
                   
            }

        }
        for (int j = 0; j < [arrfemale count]; j++)
        {
            NSMutableArray *tempary = [[NSMutableArray alloc]init];
             tempary = [arrfemale[j] mutableCopy];
            
            for(int k = 0 ; k < [tempary count] ; k++)
            {
                if([tempary[k][@"type"] isEqualToString:@"Cat"])
                {
                    [arrfemalecatdata addObject:tempary[k][@"name"]];
                }
                
            }
            
        }
        
        arrmalecat =[arrmalecatdata sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        arrfemalecat =[arrfemalecatdata sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        
        [tbldata reloadData];
        
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section
{
    NSString *headerTitle;
    
    if (section==0) {
        headerTitle = @"Male";
    } else {
        headerTitle = @"Female";
    }
    return headerTitle;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return arrmalecat.count;
    }else
    {
        return arrfemalecat.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(indexPath.section == 0)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[arrmalecat objectAtIndex:indexPath.row]];
    }
    else
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[arrfemalecat objectAtIndex:indexPath.row]];
    }
    
    return cell;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
