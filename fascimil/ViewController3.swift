//
//  ViewController3.swift
//  fascimil
//
//  Created by oem on 12/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import Foundation
import UIkit


class ViewController3: UIViewController{
    
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var buttonArrow: UIButton!
    
    var img = "img"
    var num = 1
    let control=Controllers.sharedInstance

    override func viewDidLoad(){
        self.view.backgroundColor=UIColor.blackColor()
        
        buttonArrow.setImage(UIImage(named: "leftBlueArrow"), forState: UIControlState.Normal)
        
        print("\n \(control.position) \(control.numImg)")
        
        num=control.numImg
        
        if control.position=="L" && num%2 != 0{
            var imgDetail=img+String(num)
            imagen.image=UIImage(named: imgDetail)
        }else{
            num++
            var imgDetail=img+String(num)
            imagen.image=UIImage(named: imgDetail)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
}