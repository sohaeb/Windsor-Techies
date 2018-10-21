//
//  ViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-12.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import SwifteriOS
import Firebase

class MainViewController: UIViewController {
    
    // MARK:
    // MARK: Variables
    
    var ref: DatabaseReference!
    let timesFunc = FetchingTimes()

    // MARK:
    // MARK: Outlets
    
    @IBOutlet weak var embeddedView: UIView!
    @IBOutlet weak var tabBar: UITabBarItem!
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var firstJLabel: UILabel!
    @IBOutlet weak var secondJLabel: UILabel!
    @IBOutlet weak var firstLocationJumLabel: UILabel!
    @IBOutlet weak var secondJumLocationLabel: UILabel!
    
    @IBOutlet weak var firstVal_1: UILabel!
    @IBOutlet weak var firstValu_2: UILabel!
    @IBOutlet weak var secondValu_1: UILabel!
    @IBOutlet weak var secondValu_2: UILabel!
    @IBOutlet weak var thirdValu_1: UILabel!
    @IBOutlet weak var thirdValu_2: UILabel!
    @IBOutlet weak var fourthValu_1: UILabel!
    @IBOutlet weak var fourthValu_2: UILabel!
    @IBOutlet weak var fifthValu_1: UILabel!
    @IBOutlet weak var fifthValu_2: UILabel!
    
    func firebase() {
        
        ref = Database.database().reference(withPath: "server/jumuah")
        
        // To find how many FB pages has event
        
        ref.observe(.value, with: { (snapshot) in
            
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
    
            print(postDict)
            
            if let jumuLoc1 = postDict["first_jumuah_loction"],
                let jumuTime1 =  postDict["first_jumuah_time"],
                let  jumLoc2 = postDict["second_Jumuah_location"],
                let  jumTime2 =  postDict["second_Jumuah_time"]  {
                
                self.firstJLabel.text = (jumuTime1 as! String)
                self.secondJLabel.text = (jumTime2 as! String)
                self.firstLocationJumLabel.text = jumuLoc1 as? String
                self.secondJumLocationLabel.text = (jumLoc2 as! String)
                
            } else {
                print("error")
            }
        })
    }
    
    // MARK:
    // MARK: ViewWillLoad
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let timesArray = timesFunc.findingTheDateInTheArrayAndSIplayingIt()
        
        firstVal_1.text = timesArray[0]
        firstValu_2.text = timesArray[1]
        secondValu_1.text = timesArray[3]
        secondValu_2.text = timesArray[4]
        thirdValu_1.text = timesArray[5]
        thirdValu_2.text =  timesArray[6]
        fourthValu_1.text = timesArray[7]
        fourthValu_2.text = timesArray[8]
        fifthValu_1.text = timesArray[9]
        fifthValu_2.text = timesArray[10]
    }
    
    // MARK:
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firebase()
        
        tabBar.title = ""
        tabBar.imageInsets = UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
        
    }
}
