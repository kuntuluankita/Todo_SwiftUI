//
//  NewItemViewViewModel.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false 
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        let newId = UUID().uuidString
        let newItem = TodoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createddate: Date().timeIntervalSince1970, isdone: false)
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("user").document(uId).collection("todos").document(newId).setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
        
    }
}
