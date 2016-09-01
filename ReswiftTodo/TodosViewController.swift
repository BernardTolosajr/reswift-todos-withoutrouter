//
//  TodosViewController.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 13/8/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import UIKit
import ReSwift

class TodosViewController: UIViewController, StoreSubscriber {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sc: UISegmentedControl!
    
    
    var _state: TodosState?;
    
    func getVisibleTodos(todos: [TodoState], filter: String) -> [TodoState] {
        switch filter {
        case "SHOW_ALL":
            return todos
        case "SHOW_COMPLETED":
            return todos.filter { $0.completed! }
        case "SHOW_ACTIVE":
            return todos.filter { !$0.completed! }
        default:
            return todos
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        store.subscribe(self)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillDisappear(animated: Bool) {
        store.unsubscribe(self)
    }
    
    func newState(state: TodosState) {
        _state = state;
        tableView.reloadData()
    }

    @IBAction func addTodoButtonTapped(sender: AnyObject) {
        
    }
    
    @IBAction func unwindToTodos(segue: UIStoryboardSegue) {
    
    }
    
    @IBAction func segmentChange(sender: AnyObject) {
        switch sc.selectedSegmentIndex {
        case 0:
         store.dispatch(setVisibilityFilter("SHOW_ALL"))
        break;
         case 1:
        store.dispatch(setVisibilityFilter("SHOW_COMPLETED"))
         break;
         case 2:
        store.dispatch(setVisibilityFilter("SHOW_ACTIVE"))
         break;
         default:
        store.dispatch(setVisibilityFilter("SHOW_ALL"))
        break;
        }
    }
}

extension TodosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getVisibleTodos((_state?.todos)!, filter: (_state?.visibilityFilter)!).count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let todo =  getVisibleTodos((_state?.todos)!, filter: (_state?.visibilityFilter)!)[indexPath.row]
    
        if (todo.completed == true) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TodosTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        let todo =  getVisibleTodos((_state?.todos)!, filter: (_state?.visibilityFilter)!)[indexPath.row]
        
        cell.textLabel?.text = todo.text
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo =  getVisibleTodos((_state?.todos)!, filter: (_state?.visibilityFilter)!)[indexPath.row]
        
        store.dispatch(toggleTodo(todo.uuid!))
    }
}