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
    var imgN = 1
    var savePag = 1
    //var imgNV=1
    //var imgNH=1
    var imgDef = ""
    let control=Controllers.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor=UIColor.blackColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rotated", name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        savePag=control.saveP
        imgN=control.numImg
        
        /*imgNV=control.numImgV
        imgNH=control.numImgH*/
        
        print("PAG V: \(control.numImg) salvadoIMG: \(control.saveP)\n")
        
        imgDef = img+String(control.saveP)
        
        imagen.image=UIImage(named: imgDef)
        
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
    
    /*override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        if UIDevice.currentDevice().orientation.isLandscape.boolValue{
            
            print("landscape \n")
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("push", sender: self)
            }
            //transitionLand()
            
        }else{
            
            print("portrait \n")
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("push2", sender: ViewController2.self)
            }
            //transitionPort()
        }
    }*/
    
    @IBAction func swipeImagen(sender: AnyObject) {
        
        if imgN<6{
            imgN++
            control.numImg=imgN
        }
        var imgDef=img+String(imgN)
        
        print("PAG V: \(control.numImg) salvadoIMG: \(control.saveP)\n")
        chargueImage(imgDef)
    }
    
    
    @IBAction func swipeImagenRight(sender: AnyObject) {
        
        if imgN>1{
            imgN--
            control.numImg=imgN
        }
        var imgDef=img+String(imgN)
        
        print("PAG V: \(control.numImg) salvadoIMG: \(control.saveP)\n")
        chargueImage(imgDef)
    }
    
    func chargueImage(imgDef:String){

        imagen.image=UIImage(named: imgDef)
        
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "push"){
            segue.destinationViewController as? ViewController2
        }
        else if(segue.identifier == "push2"){
            segue.destinationViewController as? ViewController
        }
    }*/
    
    /*func transitionLand(){
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("ViewController2") as ViewController2
        self.presentViewController(nextView, animated: true, completion: nil)
    }*/

}

