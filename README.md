# KTCenterFlowLayout

KTCenterFlowLayout is a subclass of UICollectionViewFlowLayout which Aligns cells to the center of a collection view. It effectively enforces the `minimumInteritemSpacing`.

### Usage

```ruby
pod 'KTCenterFlowLayout'
```

```objective-c
KTCenterFlowLayout *layout = [KTCenterFlowLayout new];
layout.minimumInteritemSpacing = 10.f;
layout.minimumLineSpacing = 10.f;


[[UICollectionViewController alloc] initWithCollectionViewLayout:layout];
```

### Example

See the layout in use in the `./Example` app:

![](https://github.com/keighl/KTCenterFlowLayout/raw/master/example.png)
