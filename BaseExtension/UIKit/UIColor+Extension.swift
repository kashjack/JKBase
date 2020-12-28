//
//  AppDelegate.swift
//  JKBase
//
//  Created by kashjack on 12/25/2020.
//  Copyright (c) 2020 kashjack. All rights reserved.
//

import UIKit

public extension UIColor {

    convenience init(hexString: String, _ alpha: CGFloat = 1) {
        var cString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if cString.hasPrefix("0X") || cString.hasPrefix("#"){
            cString = cString.suffixToString(6)
        }
        guard cString.count >= 6 else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }

        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }

}
