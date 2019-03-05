# FoundationTool

> 常用的基础方法的汇总

### UIImage+Extension

```Swift
/// 通过图片名称获取图片
///
/// 通过名称取不到图片的时候，返回`UIImage()`
/// - Parameter name: 图片名称
/// - Returns: 通过图片名称获取的图片或者`UIImage()`
public static func named(_ name: String) -> UIImage

/// 生成指定颜色和尺寸的图片
///
/// - Parameters:
///   - color: 指定的颜色
///   - size: 指定的尺寸
/// - Returns: 生成的图片
public static func colored(_ color: UIColor, size: CGSize) -> UIImage?

/// 给图片添加水印
///
/// - Parameters:
///   - image: 水印图片
///   - size: 水印的尺寸
///   - position: 水印的位置
///   - edgeInsets: 水印的边距
/// - Returns: 返回添加水印之后的图片
public func addWatermark(image: UIImage, size: CGSize? = default, at position: Position = default, edgeInsets: UIEdgeInsets = default) -> UIImage

/// 添加文字水印
///
/// - Parameters:
///   - attributedString: 属性字符串
///   - position: 水印的位置
///   - edgeInsets: 水印的边距
/// - Returns: 返回添加水印之后的图片
public func addWatermark(attributedString: NSAttributedString, at position: Position = default, edgeInsets: UIEdgeInsets = default) -> UIImage

/// 根据图片生成UIImageView
///
/// - Returns: 包含该图片的UIImageView
public func asView() -> UIImageView
```
