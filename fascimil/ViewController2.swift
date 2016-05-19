//
//  ViewController2.swift
//  fascimil
//
//  Created by oem on 09/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var imagenA: UIImageView!
    @IBOutlet weak var imagenB: UIImageView!
    
    var img = "img"
    var side = ""
    var imgDefA = ""
    var imgDefB = ""
    let control=Controllers.sharedInstance
    var savePag = 1
    var imgN = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "rotated", name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        self.view.backgroundColor=UIColor.blackColor()
        
        print("\nPAG V: \(control.numImg)")
        
        savePag=control.numImg
        control.saveP=savePag
        imgN=control.numImg
        imgDefA=img+String(control.numImg)
        imgDefB=changeImagenB()
        
        print("\nPosIMG: \(side) salvadoIMG: \(control.saveP)\n")
        
        if side=="l"{
            imagenA.image=UIImage(named: imgDefA)
            imagenB.image=UIImage(named: imgDefB)
        }else{
            imagenA.image=UIImage(named: imgDefB)
            imagenB.image=UIImage(named: imgDefA)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewCurlUpLeft(view:UIImageView,animationTime:Int){
        
        UIImageView.beginAnimations(nil, context: nil)
        UIImageView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIImageView.setAnimationDuration(NSTimeInterval(animationTime))
        UIImageView.setAnimationTransition(UIViewAnimationTransition.CurlUp, forView: view, cache: false)
        
        UIImageView.commitAnimations()
        
        print("\n...............\n")
    }
    
    func viewCurlUpRight(view:UIImageView,animationTime:Int){
        
        UIImageView.beginAnimations(nil, context: nil)
        UIImageView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIImageView.setAnimationDuration(NSTimeInterval(animationTime))
        UIImageView.setAnimationTransition(UIViewAnimationTransition.CurlDown, forView: view, cache: false)
        
        UIImageView.commitAnimations()
        
        print("\n................\n")
    }
    
    @IBAction func imgTapLeft(sender: AnyObject) {
        
        control.position="L"
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("ViewController3") as ViewController3
        self.presentViewController(nextView, animated: true, completion: nil)

        
    }
    
    @IBAction func imgTapRight(sender: AnyObject) {
        
        control.position="R"
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyboard.instantiateViewControllerWithIdentifier("ViewController3") as ViewController3
        self.presentViewController(nextView, animated: true, completion: nil)

        
    }
    
    
    func rotated(){
        if(UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation)){

        }
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation)){
            print("XxPortraitxX\n")
            control.position="Land"
            
            print("REF: save=\(control.saveP) num=\(control.numImg)\n")
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateViewControllerWithIdentifier("ViewController") as ViewController
            self.presentViewController(nextView, animated: true, completion: nil)
        }
    }
    
    func changeImagenB() -> String{
        
        if control.numImg%2 != 0{
            imgN=control.numImg+1
            side="l"
            print("\nPAGleft-VIEW2++: \(imgN)")
        }else{
            imgN=control.numImg-1
            side="r"
            print("\nPAGright-VIEW2--: \(imgN)")
        }
        
        var imgDef = img+String(imgN)
        
        print("\nPrimera rotacion-> PAG V: \(control.numImg) salvadoImg\(control.saveP)")
        
        return String(seq: imgDef)
    }
    
    
    @IBAction func swipeRightImage(sender: AnyObject) {
        
        if control.numImg>2{
            
            viewCurlUpRight(imagenA, animationTime: 1)
            
            if control.numImg%2 != 0{ //impar
                control.numImg=control.numImg-2
                
            }else{ //par
                control.numImg=control.numImg-1
                
            }
            control.saveP=control.numImg
            imagenA.image=UIImage(named: img+String(control.numImg))
            imagenB.image=UIImage(named: img+String(control.numImg+1))
            
          print("\nRight Antes PAG V: \(control.numImg) salvadoImg\(control.saveP)")
           
        }
        
        print("\nRight Despues PAG V: \(control.numImg) salvadoImg\(control.saveP)")
        
    }
    
    
    @IBAction func swipeLeftImage(sender: AnyObject) {
        
        if control.numImg<5{

            viewCurlUpLeft(imagenB, animationTime: 1)
            
            if control.numImg%2 != 0{
                control.numImg=control.numImg+2
                
            }else{
                control.numImg=control.numImg+1
                
            }
            
            control.saveP=control.numImg
            
            imagenA.image=UIImage(named: img+String(control.numImg))
            imagenB.image=UIImage(named: img+String(control.numImg+1))
            
            print("\nLeft Antes PAG V: \(control.numImg) salvadoImg\(control.saveP)")
                   }
        
        print("\nLeft Despues PAG V: \(control.numImg) salvadoImg\(control.saveP)")
    }
    
}
