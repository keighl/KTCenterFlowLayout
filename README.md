# KTCenterFlowLayout

[![CocoaPods](https://img.shields.io/cocoapods/v/KTCenterFlowLayout.svg)]()

KTCenterFlowLayout is a subclass of UICollectionViewFlowLayout which Aligns cells to the center of a collection view. It effectively enforces the `minimumInteritemSpacing`.

### Usage

```ruby
# In your Podfile

pod 'KTCenterFlowLayout'
```

Objective-C:

```objective-c
KTCenterFlowLayout *layout = [KTCenterFlowLayout new];
layout.minimumInteritemSpacing = 10.f;
layout.minimumLineSpacing = 10.f;

[[UICollectionViewController alloc] initWithCollectionViewLayout:layout];
```

Swift:

```swift
let layout = KTCenterFlowLayout()
layout.minimumInteritemSpacing = 10.0
layout.minimumLineSpacing = 10.0

UICollectionViewController(collectionViewLayout: layout)
```

### Example

See the layout in use in the `./Example` app:

<img src="https://github.com/keighl/KTCenterFlowLayout/raw/master/example.png" width="300">

### Self-sizing cells

This layout doesn't work with self-sizing collection view cells (`estimatedItemSize`). Of course, neither does the vanilla `UICollectionViewFlowLayout`. Pull requests appreciated from anybody interested in solving self-sizing layouts!
