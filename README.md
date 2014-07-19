<!--dox @defgroup NimbusKitThreading Threading -->
<div id="github" feature="Threading"></div>

![](https://github.com/NimbusKit/threading/raw/master/docs/gfx/threading_banner.gif "")

The Threading library provides general-purpose tools for working in multi-threaded environments.

Adding it to your Project
=========================

You have two options for adding this library to your project: as a framework or as source.

As a Framework
--------------

Drag the Threading.xcodeproj file into your app's Xcode project. Make sure that it is being added as a dependency.

With the library added to your project, you can now import the library header.

```objc
#import <NimbusKitThreading/NimbusKitThreading.h>
```

As Source
---------

Drag all of the files from the `src` directory into your app.

With the library added to your project, you can now import the library header.

```objc
#import "NimbusKitThreading.h"
```

What's Included
===============

Lock Store
----------

NILockStore plays nicely with Objective-C's `@synchronized` for locking on a per-object basis.

In the following example, two threads need read/write access to the same data. By sharing a NILockStore instance we're able to ensure that data is safely accessed between the two threads.

```objc
NSString* const kSomeKey = @"somekey"; // Defined externally

// A single lock store object is designed to be shared by multiple threads.
NILockStore* lockStore = [NILockStore new];

Thread 1 {
  @synchronized(lockStore[kSomeKey]) {
    // Read
    id someThreadSafeObject = lockStore[kSomeKey].object;

    // Write
    lockStore[kSomeKey].object = someNewThreadSafeObject;
  }
}

Thread 2 {
  @synchronized(lockStore[kSomeKey]) {
    // Write
    lockStore[kSomeKey].object = someNewThreadSafeObject;
  }
}
```

Dispatch Tools
--------------

NINamedDispatchBlock is a particularly handy debugging tool that can be used to identify dispatched blocks.

```objc
NSString* threadName = [NSString stringWithFormat:@"%@ waiting for message %@",
                        NSStringFromProtocol(messageProtocol),
                        messageName];
dispatch_block_t work = ^{
  // Thread work
};

// When the block begins execution, NINamedDispatchBlock will set the name of
// the NSThread.
// Upon completion, NINamedDispatchBlock will reset the name of the thread
// to its previous value.
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
               NINamedDispatchBlock(threadName, work));
```

![](https://github.com/NimbusKit/threading/raw/master/docs/gfx/NINamedDispatchBlock.png "")

NIDispatchProxy is an NSProxy implementation that can be used to post invocations to an object on a separate dispatch queue. This is particularly useful if you have a delegate whose methods should only be invoked on the main thread.

Version History
===============

1.1.0 TBD
-----

New dispatch features.

- [new] NIDispatchTools' NINamedDispatchBlock.
- [new] NIDispatchProxy for asynchronously sending messages to objects.
- Renamed the library from LockStore to Threading to capture the new scope of the library.

1.0.0 on July 3, 2014
-----

Initial release.

- Includes NILockStore.

Credits
=======

Threading was built by [Jeff Verkoeyen](http://jeffverkoeyen.com/) ([featherless](http://twitter.com/)).

Contributors
------------

You can be the first! [Open a pull request now](https://github.com/NimbusKit/lockstore/compare/).

License
=======

NimbusKit's Threading is licensed under the BSD three-clause license. For a more permissive license (no redistribution of copyright notice, etc.), please contact Jeff at jverkoey@gmail.com for pricing.
