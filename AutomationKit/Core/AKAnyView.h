//
//  AKAnyView.h
//  AutomationKit
//
//  Created by Luke Redpath on 26/03/2012.
//  Copyright (c) 2012 LJR Software Limited. All rights reserved.
//

#import "AKViewCriteria.h"


@interface AKAnyView : NSObject <AKViewCriteria>

@end

id<AKViewCriteria> AK_anyView(void);

#ifdef AK_SHORTHAND
  #define anyView AK_anyView()
#endif
