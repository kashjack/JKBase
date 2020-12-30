//
//  AppDelegate.swift
//  JKBase
//
//  Created by kashjack on 12/25/2020.
//  Copyright (c) 2020 kashjack. All rights reserved.
//


import UIKit

extension Date {
    
    // MARK:  当前时间
    static func nowTime() -> TimeInterval {
        return Date().timeIntervalSince1970
    }

    // MARK:  当前时间毫秒
    static func nowMilliTime() -> TimeInterval {
        return Date().timeIntervalSince1970 * 1000
    }

}
