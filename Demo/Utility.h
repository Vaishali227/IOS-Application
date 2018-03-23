//
//  Utility.h
//  CEFY
//
//  Created by Bacancy Technology Pvt. Ltd. on 14/08/15.
//  Copyright (c) 2015 Bacancy Technology Pvt. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (Utility*) instance;
+ (id) initobj;
+(void)getRequest :(id)dict :(NSString *)url complitionblock:(void (^)(id result)) return_block;


@end
