//
//  AKKeyValueCriteria.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCriteria.h"


@interface AKKeyValueCriteria : NSObject <AKViewCriteria>

- (id)initWithKey:(NSString *)key value:(id)value;

@end

id<AKViewCriteria> AK_hasValueForKey(id value, NSString *key);

#ifdef AK_SHORTHAND
  #define hasValueForKey(k,v) AK_hasValueForKey(k,v)
#endif
