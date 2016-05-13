//
//  Controllers.swift
//  fascimil
//
//  Created by oem on 09/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import Foundation

class Controllers {
    class var sharedInstance: Controllers {
    struct Static {
        static var instance: Controllers?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Controllers()
        }
        
        return Static.instance!
    }
    
    
    var position : String!
    var numImg : Int = 1
    var saveP : Int = 1
    var numImgH:Int = 1
    var numImgV:Int = 1
}