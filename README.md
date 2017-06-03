# AlipayWrapper

## 说明

AlipayWrapper 是 AlipaySDK 的帮助类库。它从 AlipaySDK 官方 Demo 中提取除 AlipaySDK.framework 和 AlipaySDK.bundle 之外的文件。

具体使用方法，参考 Example.

## 要求

iOS: 7.0 以上


## 集成

```ruby
pod "AlipayWrapper"
```

**注意**

如果 Podfile 中，使用了`use_frameworks!`，那么就要在 Podfile 的最后加上下面的内容，否则会报错: `target has transitive dependencies that include static binaries` 。

```ruby
pre_install do |installer|
    # workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
    def installer.verify_no_static_framework_transitive_dependencies; end
end

```

## 作者

zhenglanchun, zlanchun@icloud.com

## License

AlipayWrapper is available under the MIT license. See the LICENSE file for more info.
