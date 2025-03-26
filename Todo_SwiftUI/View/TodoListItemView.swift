//
//  TodoListItemView.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 24/03/25.
//

import SwiftUI

struct TodoListItemView: View {
    let item: TodoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color.gray )
            }
            Spacer()
        }
    }
}

#Preview {
    TodoListItemView(item: .init(id: "123", title: "Get milk", dueDate: Date().timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isdone: false))
}
