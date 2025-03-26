//
//  LoginView.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "ToDo List", subtitle: "Get Things Done", angle: 15, backgroundColor: .pink)
        
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "LogIn", backgroundColor: .blue) {
                        viewModel.logIn() 
                    }
                    .padding()
                }
                .offset(y: -50)
                
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Creat an account", destination: RegisterView() )
                }
                .padding(.bottom, 50)
                
                
                Spacer()
            }
        }
    }
    
}
#Preview {
    LoginView()
}
