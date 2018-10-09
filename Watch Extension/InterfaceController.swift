//
//  InterfaceController.swift
//  UWindsor MSA Watch Extension
//
//  Created by may on 2017-04-06.
//  Copyright © 2017 sohaeb. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var fajir: WKInterfaceLabel!
    @IBOutlet var duhur: WKInterfaceLabel!
    @IBOutlet var asr: WKInterfaceLabel!
    @IBOutlet var maghrib: WKInterfaceLabel!
    @IBOutlet var isha: WKInterfaceLabel!
    
    let timesFunc = FetchingTimes()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //prayerTimes = timesFunc.findingTheDateInTheArrayAndSIplayingIt()
        
        print("am I here ?")
        let prayerTimes = timesFunc.findingTheDateInTheArrayAndSIplayingIt()
        
        print("reached here")
        print(prayerTimes)
        
        print(prayerTimes[0])
        fajir.setText(prayerTimes[0])
        //fajirIqama.text = prayerTimes[1]
        print(prayerTimes[3])
        duhur.setText(prayerTimes[3])
        //duhurIqamah.text = prayerTimes[3]
        asr.setText(prayerTimes[5])
        //asrIqamah.text =  prayerTimes[5]
        maghrib.setText(prayerTimes[7])
        //maghribIqamah.text = prayerTimes[7]
        isha.setText(prayerTimes[9])
        //ishaIqamah.text = prayerTimes[9]
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
