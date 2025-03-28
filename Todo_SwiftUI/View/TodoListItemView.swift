//
//  TodoListItemView.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 24/03/25.
//

import SwiftUI

struct TodoListItemView: View {
    let item: TodoListItem
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // print("here 2: ", item)
                Text(item.title)
                    .font(.body)
//                    .bold()
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            
            Button {
                viewModel.toggleisDone(item: item)
            } label: {
                Image(systemName: item.isdone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    TodoListItemView(item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isdone: true))
}
