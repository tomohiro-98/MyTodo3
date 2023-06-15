//
//  CategoryImage.swift
//  MyTodo3
//
//  Created by user on 2023/06/13.
//

import SwiftUI

struct CategoryImage: View {
    
    var category: TodoData.Category
    
    init(_ category: TodoData.Category?) {
        self.category = category ?? .ImpUrg_1st
    }
    
    var body: some View {
        Image(systemName: category.image())
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .padding(2.0)
            .frame(width: 30, height: 30)
            .background(category.color())
            .cornerRadius(6.0)
    }
}

struct CategoryImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImage(TodoData.Category.ImpUrg_1st)
    }
}
