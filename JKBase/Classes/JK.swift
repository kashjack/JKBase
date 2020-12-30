//
//  JKColor.swift
//  JKBase
//
//  Created by worldunionYellow on 2020/12/28.
//


import UIKit


public protocol JKExtensionsProvider {
    associatedtype CompatibleType
    var jk: CompatibleType { get }
    static var jk: CompatibleType.Type { get }
}

public extension JKExtensionsProvider {
    /// A proxy which hosts reactive extensions for `self`.
    var jk: JK<Self> {
        get { JK(self) }
        set {}
    }
    static var jk: JK<Self>.Type {
        get { JK<Self>.self }
        set {}
    }
}

public struct JK<Base> {
    public let base: Base

    // Construct a proxy.
    //
    // - parameters:
    //   - base: The object to be proxied.
    fileprivate init(_ base: Base) {
        self.base = base
    }
}

//
extension NSObject: JKExtensionsProvider {}


//日志输出：
//Log
func printLog<T>( _ message: T, file: String = #file, method: String = #function, line: Int = #line){
    #if DEBUG
    print("")
    print("****************************************")
    debugPrint("\((file as NSString).lastPathComponent)[\(line)], \(method): ")
    print(message)
    print("****************************************")
    print("")
    #endif
}
