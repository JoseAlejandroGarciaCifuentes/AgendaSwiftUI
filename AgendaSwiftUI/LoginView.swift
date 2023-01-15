//
//  LoginView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 10/1/23.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - Private Properties
    
    @State private var email: String = ""
    @State private var pass: String = ""
    @State private var shouldShowRepeatPass = false
    
    @State var shouldShowRegister: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundColorView()
                
                VStack {
                    TitleView(title: "Login")
                    
                    textFields()
                    
                    Spacer()
                    
                    KingsLeagueImageView()
                        .padding(.bottom, 30)
                    
                    Spacer()
                    
                    loginButton(title: "Login")
                }
            }
        }
    }
    
    // MARK: - Accessory Views
    
    // Esta vista se puede sacar a la Extension de abajo pero está aqui para que sepais que tambien se puede quedar dentro del struct
    func textFields() -> some View {
        VStack(spacing: 20) {
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
            
        }
    }
}


//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


//MARK: - Extensions

extension LoginView {
    
    var loginButton: some View {
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

        }
        .background(
            NavigationLink(destination: RegisterView(), isActive: $shouldShowRegister) {
                EmptyView()
            }
        )
    }
    
    // Esta es otra manera de extraer las vistas, funciona exactamente igual que la var << loginButton: some View >>, no se esta llamando/utilizando pero la dejo aquí para que sepais ambas maneras.
    func loginButton(title: String) -> some View {
        Button {
            shouldShowRegister = true
        } label: {
            Text(title)
                .foregroundColor(.white)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(5)
                .padding(.horizontal, 21)

        }
        .background(
            NavigationLink(destination: RegisterView(), isActive: $shouldShowRegister) {
                EmptyView()
            }
        )
    }
}
