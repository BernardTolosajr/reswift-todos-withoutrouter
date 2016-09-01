//
//  TodoReducer.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 13/8/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import ReSwift

func todo(state: TodoState?, action: Action) -> TodoState {
    switch action {
    case let action as AddTodoAction:
        return TodoState(
            uuid: action.uuid,
            text: action.text,
            completed: false)
    case let action as ToggleTodoAction:
        if (state?.uuid != action.uuid) {
            return state!
        }
        
        return TodoState(uuid: state?.uuid, text: state?.text, completed: true)
    default:
        return TodoState();
    }
}

func todosReducer(state: [TodoState]?, action: Action) -> [TodoState] {
    var state = state ?? []
    
    switch action {
    case let action as AddTodoAction:
        state.append(todo(nil, action: action))
        return state;
    case let action as ToggleTodoAction:
        return state.map { return todo($0, action: action)  }
    default:
        return state;
    }
}

func visibilityReducer(state: String?, action: Action) -> String {
    let state = state ?? "SHOW_ALL"
    switch action {
    case let action as VisibilityAction:
        return action.filter;
    default:
        return state;
    }
}