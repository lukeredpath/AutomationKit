//
//  AKTypeOfView.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCriteria.h"

@interface AKTypeOfView : NSObject <AKViewCriteria>

- (id)initWithClass:(Class)viewKlass;

@end

id<AKViewCriteria> AK_isTypeOfView(Class klass);

#ifdef AK_SHORTHAND
  #define isTypeofView(klass) AK_isTypeOfView(klass)
#endif
