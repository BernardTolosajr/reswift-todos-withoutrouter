//
//  TodoViewController.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 13/8/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import UIKit
import ReSwift

class TodoViewController: UITableViewController {
    
    @IBOutlet weak var todoTextfield: UITextField!
    

    @IBAction func doneButtonTapped(sender: AnyObject) {
        store.dispatch(addTodo(todoTextfield.text!))
        self.performSegueWithIdentifier("unwindToTodos", sender: self)
    }
    
}