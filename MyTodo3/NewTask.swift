//
//  NewTask.swift
//  MyTodo3
//
//  Created by user on 2023/06/15.
//

import SwiftUI

struct NewTask: View {
    
    @State var task: String = ""
    @State var time: Date? = Date()
    @State var category: Int16 = TodoData.Category.ImpUrg_1st.rawValue
    
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

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("やること")) {
                    TextField("やることをいれる", text: $task)
                }
                Section(header: Toggle(isOn: Binding(isNotNil: $time, defaultValue: Date())){Text("じかんをきめる")}) {
                    if time != nil {
                        DatePicker(selection: Binding($time, Date()), label: { Text("ひにち") })
                    } else {
                        Text("じかんをきめていません").foregroundColor(.secondary)
                    }
                }
                Picker(selection: $category, label: Text("しゅるい")) {
                    ForEach(categories, id: \.self) { category in
                        HStack {
                            CategoryImage(category)
                            Text(category.toString())
                        }.tag(category.rawValue)
                    }
                }
                Section(header: Text("そうさ")) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "minus.circle.fill")
                            Text("やめる")
                        }.foregroundColor(.red)
                    }
                }
            }.navigationBarTitle("やることをふやす")
                .navigationBarItems(trailing: Button(action: {
                    TodoData.create(in: self.viewContext,
                                      category: TodoData.Category(rawValue: self.category) ?? .ImpUrg_1st,
                                      task: self.task,
                                      time: self.time)
                    self.save()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("ふやす")
                })
        }
    }
}


struct NewTask_Previews: PreviewProvider {
    
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        NewTask()
            .environment(\.managedObjectContext, context)
    }
}
