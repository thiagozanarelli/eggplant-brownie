//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by thiago zanarelli on 26/09/15.
//  Copyright © 2015 TI IT ZanaLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!

    @IBAction func add(){
        
        let name = nameField.text
        let happiness = happinessField.text
        
        print("eaten: \(name) \(happiness)!")
    
    }

}

