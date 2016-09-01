//
//  TodosActions.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 13/8/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import ReSwift

var nextTodoId = 0

// action
struct AddTodoAction: Action {
    let uuid: String
    let text: String
    let completed: Bool?
}

struct ToggleTodoAction: Action {
    let uuid: String
}

struct VisibilityAction: Action{
    let filter: String
}

// action creators
func addTodo(text: String) -> Action {
    let uuid = NSUUID().UUIDString

    return AddTodoAction(uuid: uuid, text: text, completed: false)
}

func toggleTodo(uuid: String) -> Action {
    return ToggleTodoAction(uuid: uuid)
}

func setVisibilityFilter(filter: String) -> Action {
    return VisibilityAction(filter: filter)
}

struct Default: Action {
}