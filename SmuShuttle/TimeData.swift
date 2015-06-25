//
//  TimeData.swift
//  SMUS
//
//  Created by KimCP on 2015. 5. 28..
//  Copyright (c) 2015년 BeehiveStudio. All rights reserved.
//

import Foundation

struct cheon {
    var campusd = ""
    var asand = ""
    var cheons = ""
    var hirex = ""
    var asana = ""
    var campusa = ""
}

var array_CN = [cheon(campusd: "*", asand: "*", cheons: "*", hirex: "*", asana: "*", campusa: "*"),
                cheon(campusd: "*", asand: "*", cheons: "*", hirex: "*", asana: "*", campusa: "8:31"),
                cheon(campusd: "*", asand: "*", cheons: "*", hirex: "*", asana: "*", campusa: "8:30"),

]

class TimeData{
    func cheon_Normal() -> Array<cheon> {
        return array_CN
    }
}
