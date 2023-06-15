//
//  NewTask.swift
//  MyTodo3
//
//  Created by user on 2023/06/15.
//

import SwiftUI

struct EditTask: View {

    @ObservedObject var todo: TodoData
    @State var showingSheet = false
    var categories: [TodoData.Category]
        = [.ImpUrg_1st, .ImpNUrg_2nd, .NImpUrg_3rd, .NImpNUrg_4th]

    @Environment(\.managedObjectContext) var viewContext

    fileprivate func save() {
        do {
            try  self.viewContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    fileprivate func delete() {
        viewContext.delete(todo)
        save()
    }
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            Form {
                Section(header: Text("やること")) {
                    TextField("やることをいれる", text: Binding($todo.task,"やることをいれる"))
                }
                Section(header: Toggle(isOn: Binding(isNotNil: $todo.time, defaultValue: Date())){Text("じかんをきめる")}) {
                    if todo.time != nil {
                        DatePicker(selection: Binding($todo.time, Date()), label: { Text("ひにち") })
                    } else {
                        Text("じかんをきめていません").foregroundColor(.secondary)
                    }
                }
                Picker(selection: $todo.category, label: Text("しゅるい")) {
                    ForEach(categories, id: \.self) { category in
                        HStack {
                            CategoryImage(category)
                            Text(category.toString())
                        }.tag(category.rawValue)
                    }
                }
                Section(header: Text("そうさ")) {
                    Button(action: {
                        self.showingSheet = true
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "minus.circle.fill")
                            Text("けす")
                        }.foregroundColor(.red)
                    }
                }
            }.navigationBarTitle("やることをかえる")
                .navigationBarItems(trailing: Button(action: {
                    self.save()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("とじる")
                })
                .actionSheet(isPresented: $showingSheet) {
                    ActionSheet(title: Text("やることをけす"), message: Text("ほんとにけしてもいいですか？"), buttons: [
                        .destructive(Text("けす")) {
                            self.delete()
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        .cancel(Text("けさない"))
                    ])
                }
        }
}


struct EditTask_Previews: PreviewProvider {
    
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        let newTodo = TodoData(context: context)
        return NavigationView {
            EditTask(todo: newTodo)
                .environment(\.managedObjectContext, context)
        }
    }
}
