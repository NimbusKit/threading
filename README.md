<!--dox @defgroup NimbusKitLockStore Lock Store -->
<div id="github" feature="LockStore"></div>
![](https://github.com/NimbusKit/lockstore/raw/master/docs/gfx/lockstore_banner.gif "")

Lock Store provides a simple mechanism for key-based, read/write access to shared data across multiple threads.

Adding it to your Project
=========================

You have two options for adding this library to your project: as a framework or as source.

As a Framework
--------------

Drag the LockStore.xcodeproj file into your app's Xcode project. Make sure that it is being added as a dependency.

With the library added to your project, you can now import the library header.

```objc
#import <NimbusKitLockStore/NimbusKitLockStore.h>
```

As Source
---------

Drag all of the files from the `src` directory into your app.

With the library added to your project, you can now import the library header.

```objc
#import "NimbusKitLockStore.h"
```

Example
=======

NILockStore plays nicely with Objective-C's `@synchronized` for locking on a per-object basis.

```objc
NSString* const kSomeKey = @"somekey"; // Defined externally, likely as an extern

NILockStore* lockStore = [NILockStore new];

@synchronized(lockStore[kSomeKey]) {
  // Read
  id someThreadSafeObject = lockStore[kSomeKey].object;

  // Write
  lockStore[kSomeKey].object = someNewThreadSafeObject;
}
```

Version History
===============

1.0.0 on July 3, 2014
-----

Initial release.

- Includes NILockStore.

Credits
=======

Lock Store was built by [Jeff Verkoeyen](http://jeffverkoeyen.com/) ([featherless](http://twitter.com/)).

Contributors
------------

You can be the first! [Open a pull request now](https://github.com/NimbusKit/lockstore/compare/).

License
=======

NimbusKit's Lock Store is licensed under the BSD three-clause license. For a more permissive license (no redistribution of copyright notice, etc.), please contact Jeff at jverkoey@gmail.com for pricing.
