
//
//  Alert.swift
//  eggplant-brownie
//
//  Created by thiago zanarelli on 28/09/15.
//  Copyright © 2015 TI IT ZanaLab. All rights reserved.
//

import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(title:String="Unpexpected Error", message:String = "Sorry for this error") {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert
        )
        let ok = UIAlertAction(
            title: "Ok",
            style: UIAlertActionStyle.Cancel,
            handler: nil
        )
        alert.addAction(ok)
        controller.presentViewController(alert, animated: true, completion: nil)
    }
}