//
//  Reducer.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 1/9/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import Nimble
import Quick
@testable import ReswiftTodo

class ReducerSpec: QuickSpec {
    override func spec() {
        describe("todos reducer") { 
            it("should handle initial state") {
                let state = todosReducer(nil, action: Default())
                expect(state).to(beEmpty())
            }
            
            it("should handle addTodo") {
                let todos = todosReducer([], action: AddTodoAction(uuid: "1", text: "Run the test", completed: nil))
                expect(todos[0].text) == "Run the test"
                expect(todos[0].completed) == false
                
                let nextTodos = todosReducer(todos, action: AddTodoAction(uuid: "2", text: "Use Redux", completed: nil))
                expect(nextTodos[1].text) == "Use Redux"
                expect(todos[0].completed) == false
            }
            
            it("should handle toggleTodo") {
                let todos = todosReducer([TodoState(uuid: "1", text: "Run the test", completed: false),
                    TodoState(uuid: "2", text: "Run the test", completed: false)],
                        action: ToggleTodoAction(uuid: "1"))
            
                expect(todos[0].completed).to(beTruthy())
                expect(todos[1].completed).to(beFalse())
            }
        }
    }
}
