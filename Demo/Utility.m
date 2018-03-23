//
//  Utility.m
//  CEFY
//
//  Created by Bacancy Technology Pvt. Ltd. on 14/08/15.
//  Copyright (c) 2015 Bacancy Technology Pvt. Ltd. All rights reserved.
//

#import "Utility.h"
#import <AFHTTPRequestOperationManager.h>

#define MAIN_URL @"http://agl-developer-test.azurewebsites.net/"

@implementation Utility

+ (Utility*) instance {
    static dispatch_once_t _singletonPredicate;
    static Utility *_singleton = nil;
    
    dispatch_once(&_singletonPredicate, ^{
        _singleton = [[super allocWithZone:nil] init];
    });
    
    return _singleton;
}

+ (id) initobj {
    return [self instance];
}

+(void)getRequest :(id)dict :(NSString *)url complitionblock:(void (^)(id result)) return_block {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager.requestSerializer setValue:@"application/json; text/html; text/plain" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; text/html; application/javascript; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    
    [manager GET:[NSString stringWithFormat:@"%@%@",MAIN_URL,url] parameters:dict success:^
     (AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        return_block(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
         NSLog(@"%@",error.localizedDescription);
         NSLog(@"%@",operation.responseString);
         NSDictionary *temp;
         temp=[[NSDictionary alloc] initWithObjectsAndKeys:operation.error.localizedDescription,@"error", nil];
       
         
         return_block(temp);
     }];
}



@end
