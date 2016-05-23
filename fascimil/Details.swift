//
//  Details.swift
//  fascimil
//
//  Created by oem on 16/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import Foundation
import UIkit

class Details{
    
    class var sharedInstance: Details {
    struct Static {
        static var instance: Details?
        static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Details()
        }
        
        return Static.instance!
    }

    var arrayButtons = [UIButton]()
    
    func details(page:String)->[UIButton]{
        
        arrayButtons.removeAll()
        
        if page == "img1"{
            print("\n Etrar entro\n")
            
            var button1 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button1.frame = CGRectMake(120,50,25,25)
            
            var button2 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button2.frame = CGRectMake(120,110,25,25)
            
            var button3 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button3.frame = CGRectMake(140,220,25,25)
            
            arrayButtons.insert(button1, atIndex: 0)
            arrayButtons.insert(button2, atIndex: 1)
            arrayButtons.insert(button3, atIndex: 2)
           
        }
        if page == "img2"{
            
            var button1 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button1.frame = CGRectMake(20,30,25,25)
            
            var button2 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button2.frame = CGRectMake(105,25,25,25)
            
            var button3 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button3.frame = CGRectMake(120,65,25,25)
            
            var button4 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button4.frame = CGRectMake(50,90,25,25)
            
            var button5 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button5.frame = CGRectMake(135,90,25,25)
            
            var button6 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button6.frame = CGRectMake(20,180,25,25)
        
            arrayButtons.insert(button1, atIndex: 0)
            arrayButtons.insert(button2, atIndex: 1)
            arrayButtons.insert(button3, atIndex: 2)
            arrayButtons.insert(button4, atIndex: 3)
            arrayButtons.insert(button5, atIndex: 4)
            arrayButtons.insert(button6, atIndex: 5)
            
        }
        if page == "img3"{
            
            var button1 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button1.frame = CGRectMake(70,90,25,25)
            
            var button2 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button2.frame = CGRectMake(135,90,25,25)
            
            var button3 = UIButton.buttonWithType(UIButtonType.ContactAdd) as UIButton
            button3.frame = CGRectMake(110,200,25,25)
            
            arrayButtons.insert(button1, atIndex: 0)
            arrayButtons.insert(button2, atIndex: 1)
            arrayButtons.insert(button3, atIndex: 2)

        }
        if page == "img4"{

        }
        
     return arrayButtons
    }
    
}

