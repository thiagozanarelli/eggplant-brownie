//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by thiago zanarelli on 26/09/15.
//  Copyright © 2015 TI IT ZanaLab. All rights reserved.
//

//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Tiago Davi on 14/12/14.
//  Copyright (c) 2014 Alura. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add(meal:Meal)
}
protocol AddAnItemDelegate {
    func addNew(item:Item)
}

class ViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate,
AddAnItemDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    @IBOutlet var tableView: UITableView?
    
    var delegate:AddAMealDelegate?
    var items = Array<Item>()
    var selected = Array<Item>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItemButton = UIBarButtonItem(
            title: "New Item",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showNewItem")
        )
        
        navigationItem.rightBarButtonItem = newItemButton
        
        self.items = Dao().loadItems()
        
    }
    
    @IBAction func showNewItem(){
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }else{
            Alert(controller: self).show()
        }
    }
    
    @IBAction func add(){
        
        
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField!.text
        let happiness = Int(happinessField!.text!)
        
        if happiness == nil{
            return
        }
        if delegate == nil {
            return
        }
        
        let meal = Meal(name:name!, happiness:happiness!)
        
        meal.items = selected
        
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
    func addNew(item: Item) {
        items.append(item)
        
        Dao().saveItems(items)
        
        if let table = tableView {
            table.reloadData()
        }
        else {
            Alert(controller: self).show(message: "Oh My God")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        if let textLabel = cell.textLabel {
            textLabel.text = item.name
        }
        return cell
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil {
            return
        }
        if cell!.accessoryType == UITableViewCellAccessoryType.None {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(items[indexPath.row])
        }else{
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let position = selected.indexOf(items[indexPath.row]){
                selected.removeAtIndex(position)
            }
        }
    }
}