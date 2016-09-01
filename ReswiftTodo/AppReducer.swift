//
//  Todos.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 13/8/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer: Reducer {
    func handleAction(action: Action, state: TodosState?) -> TodosState {
        return TodosState(
            visibilityFilter: visibilityReducer(state?.visibilityFilter, action: action),
            todos: todosReducer(state?.todos, action: action)
        )
    }
}

