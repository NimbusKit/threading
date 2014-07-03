/*
 Copyright (c) 2011-present, NimbusKit. All rights reserved.

 This source code is licensed under the BSD-style license found in the LICENSE file in the root
 directory of this source tree and at the http://nimbuskit.info/license url. An additional grant of
 patent rights can be found in the PATENTS file in the same directory and url.
 */

#import "NILockStore.h"

#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "Lock Store requires ARC support."
#endif

@implementation NILockStore {
  NSMutableDictionary* _lockableObjects;
}

- (id)init {
  if ((self = [super init])) {
    _lockableObjects = [NSMutableDictionary dictionary];
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:
          @"<%@"
          @" lockable objects: %@"
          @">",
          [super description],
          [[_lockableObjects keyEnumerator] allObjects]
          ];
}

- (NILockObject *)objectForKeyedSubscript:(id)key {
  @synchronized(self) {
    NILockObject* lock = [_lockableObjects objectForKey:key];
    if (nil == lock) {
      lock = [NILockObject new];
      [_lockableObjects setObject:lock forKey:key];
    }
    return lock;
  }
}

@end

@implementation NILockObject
@end
