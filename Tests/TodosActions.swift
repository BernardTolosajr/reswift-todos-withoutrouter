//
//  Actions.swift
//  ReswiftTodo
//
//  Created by Bernard Toloza on 1/9/16.
//  Copyright © 2016 GXI. All rights reserved.
//

import Nimble
import Quick
@testable import ReswiftTodo
@testable import ReSwift


class ActionsSpec: QuickSpec {
    override func spec() {
        describe("todo actions") {
            it("addTodo should create AddTodoAction action") {
                let action = addTodo("Use Redux") as? AddTodoAction
                expect(action?.text) == "Use Redux"
                expect(action?.uuid).toNot(beEmpty())
                expect(action?.completed).to(beFalse())
            }
            
            it("setVisibilityFilter should create VisibilityAction action") {
                let action = setVisibilityFilter("SHOW_ALL") as? VisibilityAction
                expect(action?.filter) == "SHOW_ALL"
            }
            
            it("toggleTodo should create ToggleTodoAction action") {
                let action = toggleTodo("1") as? ToggleTodoAction
                expect(action?.uuid) == "1"
            }
        }
    }
}