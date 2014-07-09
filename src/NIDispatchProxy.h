/*
 Copyright (c) 2011-present, NimbusKit. All rights reserved.

 This source code is licensed under the BSD-style license found in the LICENSE file in the root
 directory of this source tree and at the http://nimbuskit.info/license url. An additional grant of
 patent rights can be found in the PATENTS file in the same directory and url.
 */

#import <Foundation/Foundation.h>

/**
 * The NIDispatchProxy class dispatches invocations made to it to a target thread.
 */
@interface NIDispatchProxy : NSProxy

+ (instancetype)proxyWithObject:(id)object queue:(dispatch_queue_t)queue;

@end

#pragma mark - ~~~ Docs ~~~

/**
 * Example
 * -------
 *
@code
- (id<MainThreadDelegate>)delegate {
  return (id<MainThreadDelegate>)[NIDispatchProxy proxyWithObject:_delegate queue:dispatch_get_main_queue()];
}

[self.delegate someDelegateMethod]; // executed asynchronously
@endcode
 *
 * The dispatch proxy is returned in place of the delegate, ensuring that all invocations of the
 * delegate occur on the main thread thanks to targeting `dispatch_get_main_queue()`.
 *
 * @class NIDispatchProxy
 * @ingroup NimbusKitThreading
 */

/** @name Creating Dispatch Proxies */

/**
 * Allocates and initializes a dispatch proxy with a specified target.
 *
 * If either argument is `nil` then the proxy object will fail to be constructed and `nil` will be
 * returned.
 *
 * @param object The object to which all invocations on this proxy should be invoked.
 *               Weakly-referenced.  Required.
 * @param queue  The queue upon which any invocations should be executed. Required.
 * @fn NIDispatchProxy::proxyWithObject:queue:
 */
