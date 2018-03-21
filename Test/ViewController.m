//
//  ViewController.m
//  Test
//
//  Created by MaulikVaishali on 22/02/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

#import "ViewController.h"
#import <SVPullToRefresh.h>
#import <AFHTTPRequestOperationManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
     __weak ViewController *selfController = self;
    // setup pull-to-refresh
    [tblpublishdata addPullToRefreshWithActionHandler:^{
        [selfController getData];
    }];
    
    // setup infinite scrolling
    [tblpublishdata addInfiniteScrollingWithActionHandler:^{
        [selfController addBottomdata];
        
    }];
    
    [self getData];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addBottomdata{
    offset++;
 
}
-(void)getData{
    
    NSDictionary *params;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSDictionary *dict = @{@"body":json};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:@"https://dl.dropboxusercontent.com/u/746330/facts.json" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        arrData = [[NSMutableArray alloc]init];
        arrData=[responseObject mutableCopy];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSString *myString = [[NSString alloc] initWithData:operation.request.HTTPBody encoding:NSUTF8StringEncoding];
        NSLog(@"Error: %@", myString);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Datacell";
    DataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    dispatch_queue_t imageQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,  0ul);
    dispatch_async(imageQueue, ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat: @"%@",[[arrData objectAtIndex:indexPath.row] valueForKey:@"image"]]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            UIImage * image = [UIImage imageWithData:data];
            if(data != nil)
            {
                [cell.imglogo setImage:[self imageWithImage:image scaledToFillSize:CGSizeMake(cell.imglogo.frame.size.width, cell.imglogo.frame.size.height)]];
            }
        });
    });
    
    return cell;

    
}
#pragma mark -
#pragma mark - ScaleImage

-(UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size
{
    CGFloat scale = MAX(size.width/image.size.width, size.height/image.size.height);
    CGFloat width = image.size.width * scale;
    CGFloat height = image.size.height * scale;
    CGRect imageRect = CGRectMake((size.width - width)/2.0f,
                                  (size.height - height)/2.0f,
                                  width,
                                  height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [image drawInRect:imageRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
