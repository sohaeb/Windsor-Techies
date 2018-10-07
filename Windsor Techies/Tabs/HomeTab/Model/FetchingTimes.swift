//
//  
//  UWindsor Msa
//
//  Created by may on 2016-09-23.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
//import AVFoundation

class FetchingTimes {
    
    // MARK: - Variables
    
    // var audioPlayer: AVAudioPlayer?
    var times = [String]()
    var month = [String]()
    
    // MARK: - Functions
    
    func getCurrentDateAsAnArray() -> String {
        // A- 1- Get current date to use later for opening 1 csv file
        //    2- fromat it to MM-dd-yyyy
        //    3- convert it from date obj to string date
        // B-    Get the current month using compontents and assign it to "month" var
        // A- 4- return the string date as string
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        let dateInString = dateFormatter.string(from: date)
        month = dateInString.components(separatedBy: "-")
        //print("Month is \(month)")
        //print("dateINString \(dateInString) is todays date but as String")
        
        return dateInString
    }
    
    func readingTheContentsOfCSVFile() -> String {
        // 1- Access the csv file via the bundle
        // 2- Read the contents of csv to "strings" var
        // 3- Return the strings var
        
        guard let bundle = Bundle.main.url(forResource: month[1], withExtension: ".csv") else {
            print("Couldn't find csv in bundle as URL")
            return ("empty")
        }
        // print("Wokring")
        guard let strings = try? String(contentsOf: bundle) else {
            print("Couldn't get content of csv as String")
            return "Couldn't get data from file"
        }
        //  print("Strings are \(strings)")
        return strings
    }
    
    func findingTheDateInTheArrayAndSIplayingIt() -> [String] {
        
        //current date as string from the func above
        let currentDate = getCurrentDateAsAnArray()
        
        let currentDateAsDashes = currentDate.replacingOccurrences(of: "-", with: "/")
        
        
        //  print("currentDateAsDashes \(currentDateAsDashes)")
        
        // Contents of csv read from the func above
        let contentsOfCSVAsAnArray = readingTheContentsOfCSVFile()
        
        // Split the csv string to an array of strings
        var arrayOfStrings = contentsOfCSVAsAnArray.components(separatedBy: ",")
        
        for (index,value) in arrayOfStrings.enumerated() {
            arrayOfStrings[index] = value.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression).replacingOccurrences(of: "\"", with: "")
        }
        
        // print(arrayOfStrings)
        
        guard let indexOfA = arrayOfStrings.index(of: currentDateAsDashes) else {
            print("COuldn't find date")
            return ["No date"]
        }
        
        // print("indexOfA \(indexOfA)")
        
        for i in 1..<12 {
            times.append(arrayOfStrings[indexOfA + i])
        }
        
        return times
    }
}
