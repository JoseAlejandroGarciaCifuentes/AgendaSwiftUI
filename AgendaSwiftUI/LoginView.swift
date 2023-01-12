//
//  LoginView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 10/1/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var pass: String = ""
    
    @State var shouldShowRegister: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top, 20)
                    
                    TextField("Email", text: $email)
                        .frame(height: 44)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding(.horizontal, 21)
                    
                    TextField("Password", text: $pass)
                        .frame(height: 44)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .cornerRadius(5)
                        .padding(.horizontal, 21)
                    
                    Spacer()
                    
                    Image("kingsleague")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .padding(.bottom, 30)
                    
                    Button {
                        shouldShowRegister = true
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .frame(height: 60)
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(5)
                            .padding(.horizontal, 21)

                    }.background(
                        NavigationLink(destination: RegisterView(), isActive: $shouldShowRegister) {
                            EmptyView()
                        }
                    )
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
