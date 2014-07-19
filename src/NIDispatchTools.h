/*
 Copyright (c) 2011-present, NimbusKit. All rights reserved.

 This source code is licensed under the BSD-style license found in the LICENSE file in the root
 directory of this source tree and at the http://nimbuskit.info/license url. An additional grant of
 patent rights can be found in the PATENTS file in the same directory and url.
 */

#import <Foundation/Foundation.h>

dispatch_block_t NINamedDispatchBlock(NSString* name, dispatch_block_t block);

#pragma mark - ~~~ Docs ~~~

/** @name Dispatch Utilities */

/**
 * @brief Returns a dispatch_block_t that will set the name of the NSThread executing the returned
 *        block to \p name, execute \p block, and then reset the NSThread's name to the old value.
 *
 * Typical use:
@code
NSString* threadName = ...;
dispatch_block_t work = ^{
  // Thread work
};

dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
               NINamedDispatchBlock(threadName, work));
@endcode
 *
 * @fn NINamedDispatchBlock(NSString* name, dispatch_block_t block);
 * @ingroup NimbusKitThreading
 */
