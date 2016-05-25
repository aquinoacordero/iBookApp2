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
    @IBOutlet weak var detailsText: UITextView!
    
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
        
        detailsText.hidden=true
        detailsText.layer.masksToBounds=true
        detailsText.layer.borderColor=UIColor.cyanColor().CGColor
        detailsText.layer.borderWidth = 1.0
        detailsText.layer.cornerRadius = 6.0
        
        buttonArrow.setImage(UIImage(named: "leftBlueArrow"), forState: UIControlState.Normal)
        
        print("\n Position:\(control.position) numImg:\(control.numImg)")
        
        num=control.numImg
        if(num%2 == 0){
            num--
        }
        
        print("\n NUMERO pag: \(num)")
        
        if control.position=="L" && num%2 != 0{
            print("\nholas")
            var imgDetail=img+String(num)
            imagen.image=UIImage(named: imgDetail)
        }else{
            print("\nAqui")
            print("\nnum: \(num)")
            num++
            print("\nnum: \(num)")
            var imgDetail=img+String(num)
            imagen.image=UIImage(named: imgDetail)
        }
        
        page=img+String(num)
        
        print("\nPagina a ver detalles: \(page)")
        
        arrayButtons = details.details(page)
        
        len=arrayButtons.count
        
        print("\nlong Array: \(len)")
        
        chargeButtons()
  
    }
    
    override func didReceiveMemoryWarning() {
        
    }

    func chargeButtons(){
        var x=0
        
        while(x<len){
            arrayButtons[x].addTarget(self,action: "button1Action:", forControlEvents: UIControlEvents.TouchUpInside)
            arrayButtons[x].tag=x
            imagen.addSubview(arrayButtons[x])
            x++
        }
    }
    
    func button1Action(sender: UIButton){
        
    print("\n \(img+String(num))\n")
        
        if (img+String(num)=="img1"){
            
            if(sender.tag==0){
                print("BUTTON0")
                
                arrayButtons[0].removeFromSuperview()
                
                if aZoom==false{
                    self.imagen.transform=CGAffineTransformScale(self.imagen.transform, 4, 4)
                    self.imagen.transform=CGAffineTransformTranslate(self.imagen.transform, 0, 80)
                    aZoom=true
                    detailsText.hidden=false
                }else{
                    
                }
            }
            if(sender.tag==1){
                print("BUTTON1")
            }
            if(sender.tag==2){
                print("Button2")
            }
        }
        
        if (img+String(num)=="img2"){
            
            if(sender.tag==0){
                print("BUTTON0")
                
                arrayButtons[0].removeFromSuperview()
                
                if aZoom==false{
                    self.imagen.transform=CGAffineTransformScale(self.imagen.transform, 4, 4)
                    self.imagen.transform=CGAffineTransformTranslate(self.imagen.transform, 40, 100)
                    aZoom=true
                }else{
                    
                }
            }
            if(sender.tag==1){
                print("BUTTON1")
            }
            if(sender.tag==2){
                print("Button2")
            }
        }
        
        if (img+String(num)=="img3"){
            
            if(sender.tag==0){
                print("BUTTON0")
                
                arrayButtons[0].removeFromSuperview()
                
                if aZoom==false{
                    self.imagen.transform=CGAffineTransformScale(self.imagen.transform, 4, 4)
                    self.imagen.transform=CGAffineTransformTranslate(self.imagen.transform, 40, 60)
                    aZoom=true
                }else{
                    
                }
            }
            if(sender.tag==1){
                print("BUTTON1")
            }
            if(sender.tag==2){
                print("Button2")
            }
        }
        
    }

    @IBAction func tapImage(sender: AnyObject) {
        
        if aZoom==true{
            self.imagen.transform=CGAffineTransformScale(self.imagen.transform, 0.5, 0.5)
            self.imagen.transform=CGAffineTransformMakeTranslation(0, 0)
            aZoom=false
        }else{
            
        }
        
        detailsText.hidden=true
        chargeButtons()
    }
}