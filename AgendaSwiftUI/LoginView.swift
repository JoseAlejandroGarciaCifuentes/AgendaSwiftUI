//
//  LoginView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 10/1/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    
    var body: some View {
        
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 20)
                
                TextField("Email", text: $email)
                    .frame(height: 44)
                    .background(Color.white)
                    .padding(.horizontal, 21)
                
                Spacer()
                
                Button {
                    // TODO: - Login Action
                } label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(5)
                        .padding(.horizontal, 10)
                    
                }
                
            }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
