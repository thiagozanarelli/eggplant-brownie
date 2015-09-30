//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by thiago zanarelli on 27/09/15.
//  Copyright © 2015 TI IT ZanaLab. All rights reserved.
//

import UIKit



class NewItemViewController: UIViewController {
    
    var delegate: AddAnItemDelegate?
    init(delegate: AddAnItemDelegate) {
    
    super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    }
    
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    
    @IBAction func addNewItem() {
        if nameField == nil || caloriesField == nil {
        return }
        
        let name = nameField!.text
        let calories = Double(caloriesField!.text!)
        let item = Item(name: name!, calories: calories!)
        
        if delegate == nil {
        return
        }
        delegate!.addNew(item)
        
        if let navigation = navigationController{
            navigation.popViewControllerAnimated(true)
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
