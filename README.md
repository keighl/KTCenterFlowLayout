# KTCenterFlowLayout

KTCenterFlowLayout is a subclass of UICollectionViewFlowLayout which aligns collection view cells to the center of the screen. It effectively enforces the `minimumInteritemSpacing`.

### Usage

`pod 'KTCenterFlowLayout', git: 'https://github.com/keighl/KTCenterFlowLayout.git'`

```objective-c
KTCenterFlowLayout *layout = [KTCenterFlowLayout new];
layout.minimumInteritemSpacing = 10.f;
layout.minimumLineSpacing = 10.f;


[[UICollectionViewController alloc] initWithCollectionViewLayout:layout];
```

### Example

![](https://github.com/keighl/KTCenterFlowLayout/raw/master/example.png)
