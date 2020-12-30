//
//  TimeInterval+Extension.swift
//  JKBase
//
//  Created by worldunionYellow on 2020/12/29.
//

import UIKit

public extension JK where Base == TimeInterval {

    func convertToDateStr(_ dateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.init(identifier: "UTC+8")
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        var date = Date.init(timeIntervalSince1970: base)
        if base > 10000000000 {
            date = Date.init(timeIntervalSince1970: base / 1000)
        }
        if base == 0 {
            return ""
        }
        return formatter.string(from: date)
    }

}

