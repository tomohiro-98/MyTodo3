//
//  CategoryView.swift
//  MyTodo3
//
//  Created by user on 2023/06/13.
//

import SwiftUI

struct CategoryView: View {
    
    var category: TodoData.Category
    @State var numberOfTasks = 0
    @State var showList = false
    @Environment(\.managedObjectContext) var viewContext
    @State var addNewTask = false
    
    // 更新用関数
    fileprivate func update() {
        self.numberOfTasks = TodoData.count(in: self.viewContext,
                                              category: self.category)
    }
    
    var body: some View {
        
        let gradient = Gradient(colors: [category.color(),
                                         category.color().opacity(0.5)])
        let linear = LinearGradient(gradient: gradient,
                                    startPoint: .top,
                                    endPoint: .bottom)
        
        return VStack (alignment: .leading) {
            Image(systemName: category.image())
                .font(.largeTitle)
                .sheet(isPresented: $showList, onDismiss: {self.update()}) {
                    TodoList(category: self.category)
                        .environment(\.managedObjectContext, self.viewContext)
                }
            
            Text(category.toString())
            Text("・\(numberOfTasks)こ")
            Button(action: {
                self.addNewTask = true
            }) {
                Image(systemName: "plus")
            }.sheet(isPresented: $addNewTask, onDismiss: {self.update()}) {
                NewTask(category: self.category.rawValue)
                    .environment(\.managedObjectContext, self.viewContext)
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 150)
        .foregroundColor(.white)
        .background(linear)
        .cornerRadius(30)
        .onTapGesture {
            self.showList = true
        }
        .onAppear {
            self.update()
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        VStack {
            CategoryView(category: .ImpUrg_1st, numberOfTasks: 3)
            CategoryView(category: .ImpNUrg_2nd)
            CategoryView(category: .NImpUrg_3rd)
            CategoryView(category: .NImpNUrg_4th)
        }.environment(\.managedObjectContext, context)
    }
}
