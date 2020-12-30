//
//  AppDelegate.swift
//  JKBase
//
//  Created by kashjack on 12/25/2020.
//  Copyright (c) 2020 kashjack. All rights reserved.
//


import Foundation

public extension JK where Base: ExpressibleByStringLiteral {

    // 截取前n个字符
    func prefixToString(_ n: Int) -> String {
        let string = base as! String
        return String(string.prefix(n))
    }
    
    //截取后n个字符
    func suffixToString(_ n: Int) -> String {
        let string = base as! String
        return String(string.suffix(n))
    }

    /// 字符串转 Int
    /// - Returns: Int
    func toInt() -> Int? {
        if let num = NumberFormatter().number(from: base as! String) {
            return num.intValue
        } else {
            return nil
        }
    }

    /// 二进制 -> 十进制
    /// - Returns: 十进制
    func binaryTodecimal() -> String {
        let binary = self.base as! String
        var sum = 0
        for c in binary {
            if let number = "\(c)".jk.toInt() {
                sum = sum * 2 + number
            }
        }
        return "\(sum)"
    }

    
}
