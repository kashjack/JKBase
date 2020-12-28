//
//  AppDelegate.swift
//  JKBase
//
//  Created by kashjack on 12/25/2020.
//  Copyright (c) 2020 kashjack. All rights reserved.
//


import Foundation

public extension String {

    // 截取前n个字符
    func prefixToString(_ n: Int) -> String {
        return self.prefix(n).toString()
    }
    
    //截取后n个字符
    func suffixToString(_ n: Int) -> String {
        return self.suffix(n).toString()
    }
    
}
