//
//  TodoState.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 13/8/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import ReSwift

struct TodosState: StateType {
    var visibilityFilter: String
    var todos: [TodoState]
}

struct TodoState: StateType {
    var uuid: String?
    var text: String?
    var completed: Bool?
}

struct VisivilityState: StateType {
    var visivility: String
}