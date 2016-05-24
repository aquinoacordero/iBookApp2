//
//  ViewController4.swift
//  fascimil
//
//  Created by oem on 24/05/16.
//  Copyright (c) 2016 oem. All rights reserved.
//

import Foundation
import UIkit

class ViewController4: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    var pg = "pg"
    var num = 1
    var page = ""
    let control=Controllers.sharedInstance
    
    override func viewDidLoad() {
        
        num=control.numImg
        var page=pg+String(num)
        print("\n \(page)\n")
        control.saveP=num
        textView.text=textPage(page)
        
        print("salvado:\(control.saveP)")
    }
    
    
    func textPage(page:String)->String{
        var text = ""
        
        if page=="pg1"{
            text = "Erferfb erferfer\nerfefer erferfe erferf erfre\nerferferfef erferf eroerf eirjoi erfj orijoirj joyg\nnkjnuin bibiub ubibiub biubui\noinoin nionun unuinu qwede 44rffw"
        }
        if page=="pg2"{
            text = "erferfbrtbrbrtberferferfe werrtgrbgnkferfrtgrgerfwerferfwerf erfwerferferfejoijnhohno werfeorfeorinfoie erifefergrtgrtgio erflrtgrtgtreferlf erferferfwerferferfepr     fmerfpeprferfomeorfm poermf             oermfeormf opmrtgrtgtrger ope opm o mer efrhfejnf,l,l erf erf erfn erfiowrfope e erifjerjfoerjfpe jerfjeoifjer jfek fkerfkermf uykuku ukiukuik"
        }
        if page=="pg3"{
            text = "erferfbrtbrbrtberferferfe werrtgrbgnkferfrtgrgerfwerferfwerf erfwerferferfejoijnhohno werfeorfeorinfoie erifefergrtgrtgio erflrtgrtgtreferlf erferferfwerferferfepr     fmerfpeprferfomeorfm poermf             oermfeormf opmrtgrtgtrger ope opm o mer efrhfejnf,l,l erf bthybtb tyhgtyhty lonkoknm km km  kmkmokijo ii ioio nhjk bjkb jbjkbo  oboibo  tygtryhey yhtht tyhtyhet tyh tyh tythty hty tyhtyhtujktv uitjyt yujy erf erfn erfiowrfope e erifjerjfoerjfpe jerfjeoifjer jfek fkerfkermf uykuku ukiukuik"
        }
        if page=="pg4"{
            text = "erferfbrtbrbrtberferferfe werrtgrbgnkferfrtgrgerfwerferfwerf erfwerferferfejoijnhohno werfeorfeorinfoie erifefergrtgrtgio erflrtgrtgtreferlf erferferfwerfh6uhj  erferfepr     fmerfpeprferfomeo    67h67h6hyu  67h67hrfm poermf ww45tw45t4t  ujyujyujyut yujyjyjy   yjyj      oermfeormf opmrtgrtgtrger ope opm o mer efrhfejnf,l,l erf erf erfn erfiowrfope e erifje45t4w5b   6y5v 6e6y5 57y54y 56y56u 46y56y56y5657u 47 yrjfoerjfpe jerfjeoifjer jfek fkerfkermf uykuku ukiukuik"
        }
        if page=="pg5"{
            text = "h uihiuhui huihuih iuhiuhq9d9 hw3 d34d9 3h94 h349 h394h dwhei hwo wpf qh ferhf ieurfeuif uireuihfewuiqpfh 0rf 0rf erqfcner rfnerf0 erf erfbrtbrbrtberferferfe werrtgrbgnkferfrtgrgerfwerferfwerf erfwerferferfejoijnhohno werfeorfeorinfoie erifefergrtgr wieurfhiuerh eiwrufheiurfhuieh erifhekjr jaenrfkejrnf erkjnfekjrn erjnfernf ernk  rferf erkfjenrk nreño iojoij ijoj ojoijoij l,ñ, erferf erfetgio erflrtgrtgtreferlf erferferfwerferferfepr     fmerfpeprferfomeorfm poermf             oermfeormf opmr kewbqvewxycv vegd3u84dfwer ref93fericf ier reif reufbhei er  rewfw tgrtgtrger ope opm o mer efrhfejnf,l,l erf erf erfn erfiowrfope e erifjerjfoerjfpe jerfjeoifjer jfek fkerfkermf uykuku ukiukuik"
        }
        
        return text
    }
    
    func chargeText(){
        num++
        var page=pg+String(num)
        textView.text=textPage(page)
        
    }
    
    @IBAction func SwipeLeftText(sender: AnyObject) {
        chargeText()
    }
}