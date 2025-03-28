//
//  TodoListItem.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//

import FirebaseFirestore
import Foundation

struct TodoListItem: Codable, Identifiable {
    var id: String
    var title: String
    var dueDate: TimeInterval
    var createddate: TimeInterval
    var isdone: Bool = false
    
    mutating func setDone(_ state: Bool) {
        isdone = state
    }
}
