//
//  MainViewViewModel.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
//        do {
//            try Auth.auth().signOut()
//            print("User signed out successfully")
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
        
        let handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
