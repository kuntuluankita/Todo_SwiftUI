//
//  TLButton.swift
//  Todo_SwiftUI
//
//  Created by Kuntulu Ankita on 25/03/25.
//

import SwiftUI

struct TLButton: View {
    
    var title: String
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                
            }
        }
        .padding()
    }
}

#Preview {
    TLButton(title: "Value", backgroundColor: .pink) {
        
    }
}
