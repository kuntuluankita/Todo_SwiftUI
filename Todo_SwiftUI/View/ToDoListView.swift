//
//  ToDoListView.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
      
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.deleteItem(id: item.id)
                            }
                            .tint(.red)
                                    
                        }
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
    ToDoListView(userId: "DBSfJohccTViarfBxetRZeAVfbd2")
}
