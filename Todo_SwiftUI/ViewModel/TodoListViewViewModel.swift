//
//  TodoListViewViewModel.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//

import FirebaseFirestore
import Foundation

class TodoListViewViewModel: ObservableObject {
    
    private let userId: String
    
    @Published var showingNewItemView = false
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteItem(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
            
    }
}
