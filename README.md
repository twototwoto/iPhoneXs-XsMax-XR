# iPhoneXs-XsMax-XR
iPhoneXs&amp;XsMax&amp;XR的适配准备

* 添加部分可能用到的宏

```objc
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenScale [UIScreen mainScreen].scale

#define isIPhoneX_Xs (ScreenWidth == 375.0 && ScreenHeight == 812.0)
#define isIPhoneXR ((ScreenWidth == 414.0 && ScreenHeight == 896.0) && ScreenScale == 2.0)
#define isIPhoneXsMax ((ScreenWidth == 414.0 && ScreenHeight == 896.0) && ScreenScale == 3.0)
#define StatusBarHeight ((isIPhoneX_Xs || isIPhoneXR || isIPhoneXsMax) ? 44.0 : 20.0)
#define NavBarHeight ((isIPhoneX_Xs || isIPhoneXR || isIPhoneXsMax) ? 44.0)
#define StatusNavBarHeight (StatusBarHeight + NavBarHeight)
#define TabBarHeight ((isIPhoneX_Xs || isIPhoneXR || isIPhoneXsMax) ? 83.0 : 49.0)
#define BottomSafeAreaHeight 34.0
```
