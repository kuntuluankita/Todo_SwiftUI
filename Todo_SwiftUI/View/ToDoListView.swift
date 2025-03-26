//
//  ToDoListView.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = TodoListViewViewModel()
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos ")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    Text(item.title)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button{
                     viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                    
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newitemPresented: $viewModel.showingNewItemView)
            }
            
        }
    }
}

#Preview {
    ToDoListView(userId: "diHBGtMaJ4NqWRSqGb9XaQCRvrF3")
}
