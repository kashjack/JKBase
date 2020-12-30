//
//  AppDelegate.swift
//  JKBase
//
//  Created by kashjack on 12/25/2020.
//  Copyright (c) 2020 kashjack. All rights reserved.
//


import UIKit

public extension JK where Base: ExpressibleByStringLiteral {

    // subString转字符串
    func toString() -> String {
        let string = base as! Substring
        return String(string)
    }

}
