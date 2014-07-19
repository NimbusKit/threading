/*
 Copyright (c) 2011-present, NimbusKit. All rights reserved.

 This source code is licensed under the BSD-style license found in the LICENSE file in the root
 directory of this source tree and at the http://nimbuskit.info/license url. An additional grant of
 patent rights can be found in the PATENTS file in the same directory and url.
 */

#import <Foundation/Foundation.h>

@class NILockObject;

/**
 * @brief NILockStore provides thread-safe, read-write, key-based access to a dictionary of objects.
 */
@interface NILockStore : NSObject
- (NILockObject *)objectForKeyedSubscript:(id)key;
@end

/**
 * @brief NILockObject stores the object for a specific key in NILockStore and should be used as a
 *        consistent `@synchronized` lock.
 */
@interface NILockObject : NSObject
@property (nonatomic, strong) id object;
@end

#pragma mark - ~~~ Docs ~~~

/**
 * Typical use:
 *
@code
NSString* const kSomeKey = @"somekey"; // Defined externally, likely as an extern

NILockStore* lockStore = [NILockStore new];

@synchronized(lockStore[kSomeKey]) {
  // Read
  id someThreadSafeObject = lockStore[kSomeKey].object;

  // Write
  lockStore[kSomeKey].object = someNewThreadSafeObject;
}
@endcode
 *
 * How it Works
 * ------------
 *
 * An instance of NILockStore dispenses a NILockObject when accessed with `[]` notation.
 * The dispensed NILockObject instances are consistent between every access, allowing you to provide
 * the object to `@synchronized` in order to create an object-specific read/write lock.
 *
 * Once a lock has been acquired, you can safely read and write the NILockObject's
 * NILockObject::object at will.
 *
 * > Effort should be made to minimize the amount of time spent locking any given object.
 *
 * @class NILockStore
 * @ingroup NimbusKitThreading
 */

/**
 * @class NILockObject
 * @ingroup NimbusKitThreading
 */

/** @name Accessing Lockable Objects */

/**
 * Provides support for keyed access to the lockable store.
 *
 * @fn NILockStore::objectForKeyedSubscript:
 */

/** @name Accessing Objects */

/**
 * A strong reference to an object of any type.
 *
 * By default this is nil.
 *
 * @fn NILockObject::object
 */
