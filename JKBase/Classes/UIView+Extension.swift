//
//  UIView+Extension.swift
//  Swift-Useful-Extensions
//
//  Created by Yin Xu on 6/9/14.
//  Copyright (c) 2014 YinXuApp. All rights reserved.

import UIKit

@IBDesignable
public extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }


    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.white
        }
        set {
            layer.borderColor =  newValue.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth =  newValue
        }
    }
}

public extension JK where Base: UIView {

    // MARK:  切圆角
    // Parameters:
    //   corners: 需要实现为圆角的角，可传入多个
    //   radii: 圆角半径

    func corner(byRoundingCorners corners: UIRectCorner?, bounds: CGRect? = nil, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds ?? base.bounds, byRoundingCorners: corners ?? [UIRectCorner.topLeft, UIRectCorner.topRight, UIRectCorner.bottomLeft, UIRectCorner.bottomRight], cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        base.layer.mask = maskLayer
    }
}




