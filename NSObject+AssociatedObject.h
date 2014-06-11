//
//  NSObject+AssociatedObject.h
//  J3Dps
//
//  Created by hongtao on 14-6-11.
//  Copyright (c) 2014年 hongtao5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObject)

- (id)objectWithAssociatedKey:(void *)key;
- (void)setObject:(id)object forAssociatedKey:(void *)key retained:(BOOL)retain;

@end
