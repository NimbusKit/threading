/*
 Copyright (c) 2011-present, NimbusKit. All rights reserved.

 This source code is licensed under the BSD-style license found in the LICENSE file in the root
 directory of this source tree and at the http://nimbuskit.info/license url. An additional grant of
 patent rights can be found in the PATENTS file in the same directory and url.
 */

#import "NIDispatchProxy.h"

@implementation NIDispatchProxy {
  __weak id _object;
  dispatch_queue_t _queue;
}

- (id)initWithObject:(id)object queue:(dispatch_queue_t)queue {
  if (nil == object || nil == queue) {
    self = nil;
    return nil;
  }
  _object = object;
  _queue = queue;
  return self;
}

+ (instancetype)proxyWithObject:(id)object queue:(dispatch_queue_t)queue {
  return [[self alloc] initWithObject:object queue:queue];
}

- (NSString *)description {
  return [@"Proxied object: " stringByAppendingString:[_object description]];
}

- (NSString *)debugDescription {
  return [@"Proxied object: " stringByAppendingString:[_object debugDescription]];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
  dispatch_async(_queue, ^{
    [invocation invokeWithTarget:_object];
  });
}

- (BOOL)respondsToSelector:(SEL)sel {
  return [_object respondsToSelector:sel];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
  return [(NSObject *)_object methodSignatureForSelector:sel];
}

@end
