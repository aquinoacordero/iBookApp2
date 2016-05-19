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
    var page = ""
    var aZoom = false
    var len = 1
    let control=Controllers.sharedInstance
    let details=Details.sharedInstance
    var arrayButtons = [UIButton]()

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
        
        page=img+String(num)
        
        print("\nPagina a ver detalles: \(page)")
        
        arrayButtons = details.details(page)
        
        len=arrayButtons.count
        
        print("\n \(len)")
        
        chargeButtons()
  
    }
    
    override func didReceiveMemoryWarning() {
        
    }

    func chargeButtons(){
        var x=0
        let but="button"
        let act="Action:"
        
        while(x<len){
            var butAct=but+String(x)+act
            print("\n \(butAct)")
            //arrayButtons[x].addTarget(self,action: butAct, forControlEvents: UIControlEvents.TouchUpInside)
            imagen.addSubview(arrayButtons[x])
            x++
        }
    }
    
    func button1Action(sender: UIButton){
    
    println("BUTTON1")
  
    
    }

}