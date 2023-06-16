//
//  TodoDetailRow.swift
//  MyTodo3
//
//  Created by user on 2023/06/14.
//

import SwiftUI

struct TodoDetailRow: View {
    @ObservedObject var todo: TodoData
    
    var hideIcon = false
    
    var body: some View {
        HStack {
            if !hideIcon {
                CategoryImage(TodoData.Category(rawValue: todo.category))
            }
            CheckBox(checked: Binding(get: {
                self.todo.state == TodoData.State.done.rawValue
            }, set: {
                self.todo.state = $0 ? TodoData.State.done.rawValue :
                TodoData.State.todo.rawValue
            })) {
                if self.todo.state == TodoData.State.done.rawValue {
                    Text(self.todo.task ?? "no title").strikethrough()
                } else {
                    Text(self.todo.task ?? "no title")
                }
            }.foregroundColor(
                self.todo.state == TodoData.State.done.rawValue ? .secondary : .primary
            )
        }.gesture(DragGesture().onChanged({ value in
            if value.predictedEndTranslation.width > 200 {
                if self.todo.state != TodoData.State.done.rawValue {
                    self.todo.state = TodoData.State.done.rawValue
                }
            } else if value.predictedEndTranslation.width < -200 {
                if self.todo.state != TodoData.State.todo.rawValue {
                    self.todo.state = TodoData.State.todo.rawValue
                }
            }
        }))
    }
}

struct TodoDetailRow_Previews: PreviewProvider {
    
//    static let container = PersistenceController.shared.container
//    static let context = container.viewContext
    
    static let context = PersistenceController.shared.container.viewContext
    
    static var previews: some View {

//        let context = (UIApplication.shared.delegate as! AppDelegate)
//            .persistentContainer.viewContext

        let newTodo = TodoData(context: context)
        newTodo.task = "うがい・てあらい"
        newTodo.state = TodoData.State.done.rawValue
        newTodo.category = 0
        let newTodo1 = TodoData(context: context)
        newTodo1.task="しゅくだい"
        newTodo.category = 1
        let newTodo2 = TodoData(context: context)
        newTodo2.task="タブレットのべんきょう"
        newTodo2.category = 2
        let newTodo3 = TodoData(context: context)
        newTodo3.task="３０分でごはんをたべおわる"
        newTodo3.category = 3
        return VStack(alignment: .leading) {
            VStack {
                TodoDetailRow(todo: newTodo)
                TodoDetailRow(todo: newTodo, hideIcon: true)
                TodoDetailRow(todo: newTodo1)
                TodoDetailRow(todo: newTodo2)
                TodoDetailRow(todo: newTodo3)
            }.environment(\.managedObjectContext, context)
        }
    }
}
