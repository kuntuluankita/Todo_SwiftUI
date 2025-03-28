//
//  ProfileView.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 24/03/25.
//

import FirebaseAuth
import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                           Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        HStack {
                           Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        HStack {
                           Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                    .padding()
                    
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    
                    Spacer()
                } else {
                    Text("Loding Profile....")
                }
                
            }
            .navigationTitle("Profile")

        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

#Preview {
    ProfileView()
}
