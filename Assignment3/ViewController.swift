//
//  ViewController.swift
//  Assignment3
//
//  Created by Albert Pierce on 3/26/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var labelCounter = 30
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var ConceptLabel: UILabel!
    
    let labelArray: [String] = ["Let vs Var", "Computed Initializers", "Computed Variables", "Setter Observers", "Functions", "External Parameters", "Default Parameters", "Anonymous Functions", "Optional Chaining", "Failable Initializers", "Casting", "Class Methods", "Extensions", "Enumeration", "Error Handling", "Dictionaries", "Conditional Binding", "Protocols", "Inheritance", "Structs", "Enums", "Subscripts" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        TimerLabel.text = "0:30"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ExitButton(sender: AnyObject) {
       exit(0)
    }

    @IBAction func NextViewButton(sender: AnyObject) {
        
        let randomInteger = Int(arc4random_uniform(22))
        
        ConceptLabel.text = labelArray[randomInteger]
        
        labelCounter = 30
        
        TimerLabel.text = "0:\(labelCounter)"
        
        //reset timer
        
    }
    
    //random number from 0-22
    
    
    func updateTimer() {
        
        labelCounter = labelCounter - 1
        if(labelCounter >= 0){
            TimerLabel.text = "0:\(labelCounter < 10 ? "0":"")\(labelCounter)"
            
            if(labelCounter == 0){
                let randomInteger = Int(arc4random_uniform(23))
                ConceptLabel.text = labelArray[randomInteger]
                
                TimerLabel.text = "0:30"
                
                labelCounter = 30
                
            }
            
            if(labelCounter < 10){
                TimerLabel.text = "0:0\(labelCounter)"
            }
            
            
            
        }
        
        
    }
    
}

