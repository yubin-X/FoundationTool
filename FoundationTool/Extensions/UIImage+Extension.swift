//
//  UIImage+Extension.swift
//  FoundationTool
//
//  Created by yubin-X on 2019/3/4.
//  Copyright © 2019年 ld. All rights reserved.
//

import UIKit



public enum Position {
    case left
    case right
    case top
    case bottom
    case center
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

extension UIImage {
    
    
    /// 通过图片名称获取图片
    ///
    /// 通过名称取不到图片的时候，返回`UIImage()`
    /// - Parameter name: 图片名称
    /// - Returns: 通过图片名称获取的图片或者`UIImage()`
    public static func named(_ name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage()
    }
    
    
    /// 生成指定颜色和尺寸的图片
    ///
    /// - Parameters:
    ///   - color: 指定的颜色
    ///   - size: 指定的尺寸
    /// - Returns: 生成的图片
    public static func colored(_ color: UIColor, size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height:
            size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// 给图片添加水印
    ///
    /// - Parameters:
    ///   - image: 水印图片
    ///   - size: 水印的尺寸
    ///   - position: 水印的位置
    ///   - edgeInsets: 水印的边距
    /// - Returns: 返回添加水印之后的图片
    public func addWatermark(image: UIImage, size: CGSize? = nil, at position: Position = .center, edgeInsets: UIEdgeInsets = UIEdgeInsets.zero) -> UIImage {
        let watermarkSize = size ?? image.size
        let rect = caculateRact(containerSize: self.size, watermarkSize: watermarkSize, position: position, edgeInsets: edgeInsets)
        UIGraphicsBeginImageContext(self.size)
        self.draw(in: CGRect(origin: .zero, size: self.size))
        image.draw(in: rect)
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return newImage
        }
        else {
            return self
        }
    }
    
    private func caculateRact(containerSize: CGSize, watermarkSize: CGSize, position: Position, edgeInsets: UIEdgeInsets) -> CGRect {
        var x, y, w, h: CGFloat
        switch position {
        case .left:
            x = edgeInsets.left
            y = (containerSize.height - watermarkSize.height) / 2 + edgeInsets.top
            w = watermarkSize.width
            h = watermarkSize.height
        case .right:
            x = containerSize.width - watermarkSize.width - edgeInsets.right
            y = (containerSize.height - watermarkSize.height) / 2 + edgeInsets.top
            w = watermarkSize.width
            h = watermarkSize.height
        case .top:
            x = (containerSize.width - watermarkSize.width) / 2 + edgeInsets.left
            y = edgeInsets.top
            w = watermarkSize.width
            h = watermarkSize.height
        case .bottom:
            x = (containerSize.width - watermarkSize.width) / 2 + edgeInsets.left
            y = containerSize.height - watermarkSize.height - edgeInsets.bottom
            w = watermarkSize.width
            h = watermarkSize.height
        case .center:
            x = (containerSize.width - watermarkSize.width) / 2 + edgeInsets.left
            y = (containerSize.height - watermarkSize.height) / 2 + edgeInsets.top
            w = watermarkSize.width
            h = watermarkSize.height
        case .topLeft:
            x = edgeInsets.left
            y = edgeInsets.top
            w = watermarkSize.width
            h = watermarkSize.height
        case .topRight:
            x = containerSize.width - watermarkSize.width - edgeInsets.right
            y = edgeInsets.top
            w = watermarkSize.width
            h = watermarkSize.height
        case .bottomLeft:
            x = edgeInsets.left
            y = containerSize.height - watermarkSize.height - edgeInsets.bottom
            w = watermarkSize.width
            h = watermarkSize.height
        case .bottomRight:
            x = containerSize.width - watermarkSize.width - edgeInsets.right
            y = containerSize.height - watermarkSize.height - edgeInsets.bottom
            w = watermarkSize.width
            h = watermarkSize.height
        }
        return CGRect(x: x, y: y, width: w, height: h)
    }
    
    /// 添加文字水印
    ///
    /// - Parameters:
    ///   - attributedString: 属性字符串
    ///   - position: 水印的位置
    ///   - edgeInsets: 水印的边距
    /// - Returns: 返回添加水印之后的图片
    public func addWatermark(attributedString: NSAttributedString, at position: Position = .center, edgeInsets: UIEdgeInsets = .zero) -> UIImage {
        let textContainersize = CGSize(width: self.size.width - edgeInsets.left - edgeInsets.right, height: self.size.height - edgeInsets.top - edgeInsets.bottom)
        let textSize = attributedString.calculateSize(inSize: textContainersize)
        let textRect = caculateRact(containerSize: self.size, watermarkSize: textSize, position: position, edgeInsets: edgeInsets)
        UIGraphicsBeginImageContext(self.size)
        self.draw(in: CGRect(origin: .zero, size: self.size))
        attributedString.draw(in: textRect)
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return newImage
        }
        else {
            return self
        }
    }
    
    /// 根据图片生成UIImageView
    ///
    /// - Returns: 包含该图片的UIImageView
    public func asView() -> UIImageView {
        return UIImageView(image: self)
    }
}
