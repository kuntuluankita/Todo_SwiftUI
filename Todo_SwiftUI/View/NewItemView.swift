//
//  NewItemView.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newitemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", backgroundColor: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newitemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                   
                }
                .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error") , message: Text("Please fill all the fields and select due date that is today or newer."))
            }
        }
    }
}

#Preview {
    NewItemView(newitemPresented: Binding(get: {
        return true
    }, set: { _ in
        print("")
    }))
}
