//
//  TodoList.swift
//  MyTodo3
//
//  Created by user on 2023/06/13.
//
//

import SwiftUI
import CoreData

struct TodoList: View {

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoData.time,
                                           ascending: true)],
        animation: .default)

    var todoList: FetchedResults<TodoData>
    
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var keyboard = KeyboardObserver()
    
    // 削除用関数
    fileprivate func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let entity = todoList[index]
            viewContext.delete(entity)
        }
        do {
            try viewContext.save()
        } catch {
            print("Delete Error. \(offsets)")
        }
    }
    
    let category: TodoData.Category

    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(todoList) { todo in
                        if todo.category == self.category.rawValue {
                            NavigationLink(destination: EditTask(todo: todo)) {
                                TodoDetailRow(todo: todo, hideIcon: true)
                            }
                        }
                    }.onDelete(perform: deleteTodo)
                }
                QuickNewTask(category: category)
                    .padding()
            }.navigationBarTitle(category.toString())
            .navigationBarItems(trailing: EditButton())
        }.onAppear{
            self.keyboard.startObserve()
            UIApplication.shared.closeKeyboard()
        }.onDisappear{
            self.keyboard.stopObserve()
            UIApplication.shared.closeKeyboard()
        }.padding(.bottom, keyboard.keyboardHeight)
    }
}

struct TodoList_Previews: PreviewProvider {
    
    static let container = PersistenceController.shared.container
    static let context = container.viewContext

    //    static let context = (UIApplication.shared.delegate as! AppDelegate)
    //        .PersistentContainer.viewContext

    static var previews: some View {
        // テストデータの全削除
        let request = NSBatchDeleteRequest(
            fetchRequest: NSFetchRequest(entityName: "TodoData"))
        try! container.persistentStoreCoordinator.execute(request,
                                                          with: context)

        // データを追加
        TodoData.create(in: context,
                          category: .ImpUrg_1st, task: "うがい・てあらい")
        TodoData.create(in: context,
                          category: .ImpNUrg_2nd, task: "ほんよみ")
        TodoData.create(in: context,
                          category: .NImpUrg_3rd, task: "かきとり")
        TodoData.create(in: context,
                          category: .NImpNUrg_4th, task: "あらいものをだす")
    
        return TodoList(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, context)
    }
}
