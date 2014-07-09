/*
 Copyright (c) 2011-present, NimbusKit. All rights reserved.

 This source code is licensed under the BSD-style license found in the LICENSE file in the root
 directory of this source tree and at the http://nimbuskit.info/license url. An additional grant of
 patent rights can be found in the PATENTS file in the same directory and url.
 */

#import "NIDispatchTools.h"

dispatch_block_t NINamedDispatchBlock(NSString* name, dispatch_block_t block) {
  return ^{
    NSThread* currentThread = [NSThread currentThread];
    NSString* oldName = currentThread.name;
    currentThread.name = name;

    if (block) {
      block();
    }

    currentThread.name = oldName;
  };
}
