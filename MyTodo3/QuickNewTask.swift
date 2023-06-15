//
//  QuickNewTask.swift
//  MyTodo3
//
//  Created by user on 2023/06/13.
//

import SwiftUI

struct QuickNewTask: View {
    let category: TodoData.Category
    
    @State var newTask: String =  ""
    @Environment(\.managedObjectContext) var viewContext
    
    fileprivate func addNewTask() {
        TodoData.create(in: self.viewContext,
                          category: self.category,
                          task: self.newTask)
        self.newTask = ""
    }
    
    fileprivate func cancelTask() {
        self.newTask = ""
    }
    
    var body: some View {
        HStack {
            TextField("これからやること", text: $newTask) {
                self.addNewTask()
            }
            .foregroundColor(.blue)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.addNewTask()
            })
            {
                Text("ふやす").foregroundColor(.blue)                
            }
            Button(action: {
                self.cancelTask()
            })
            {
                Text("やめる").foregroundColor(.red)
            }
        }
    }
}

struct QuickNewTask_Previews: PreviewProvider {
    
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        QuickNewTask(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, context)
    }
}
