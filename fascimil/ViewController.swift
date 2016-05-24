//
//  ViewController.swift
//  fascimil
//
//  Created by oem on 09/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import UIKit


class ViewController: UIViewController {


    @IBOutlet weak var imagen: UIImageView!

    let img = "img"
    var page = ""
    var imgN = 1
    var savePag = 1
    var len = 1
    var imgDef = ""
    var arrayButtons = [UIButton]()
    let control=Controllers.sharedInstance
    let details=Details.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor=UIColor.blackColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rotated", name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        savePag=control.saveP
        imgN=control.numImg
        
        
        print("PAG V: \(control.numImg) salvadoIMG: \(control.saveP)\n")
        
        imgDef = img+String(control.saveP)
        
        imagen.image=UIImage(named: imgDef)
        
        page=img+String(imgN)
        
        arrayButtons = details.details(page)
        
        len=arrayButtons.count
        
        chargeButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rotated(){
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)){
            print("XxLandscapexX\n")
            control.position="Port"
            
            print("\nEspera------------->\(control.position) and PAG V:\(control.numImg)\n")
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateViewControllerWithIdentifier("ViewController2") as ViewController2
            self.presentViewController(nextView, animated: true, completion: nil)
        }
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation)){
            print("XxPortraitxX\n")
            control.position="Land"
            print("\nEspera------------->\(control.position)\n")
            
        }
    }
    
    
    @IBAction func swipeImagen(sender: AnyObject) {
        deletButtons()
        
        if imgN<6{
            imgN++
            control.numImg=imgN
        }
        var imgDef=img+String(imgN)
        
        print("PAG V: \(control.numImg) salvadoIMG: \(control.saveP)\n")
        actDetailArray()
        chargueImage(imgDef)
        chargeButtons()
        
    }
    
    
    @IBAction func swipeImagenRight(sender: AnyObject) {
        deletButtons()
        
        if imgN>1{
            imgN--
            control.numImg=imgN
        }
        var imgDef=img+String(imgN)
        
        print("PAG V: \(control.numImg) salvadoIMG: \(control.saveP)\n")
        actDetailArray()
        chargueImage(imgDef)
        chargeButtons()
    }
    
    func chargueImage(imgDef:String){

        imagen.image=UIImage(named: imgDef)
        
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
    
    func deletButtons(){
        var x=0
        
        while(x<len){
            arrayButtons[x].removeFromSuperview()
            x++
        }

    }
    
    func actDetailArray(){
        
        page=img+String(imgN)
        
        arrayButtons = details.details(page)
        
        len=arrayButtons.count

        
    }

}

