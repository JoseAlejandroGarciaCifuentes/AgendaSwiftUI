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
    
    @State private var shouldShowRegister: Bool = false
    @State private var shouldShowAgenda: Bool = false
    
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
                    
                    HStack {
                        Text("Haven't got an account yet?")
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                        
                        Spacer()
                        
                        Button {
                            shouldShowRegister = true
                        } label: {
                            Text("Register")
                                .font(.system(size: 17))
                        }
                        .background(
                            NavigationLink(destination: RegisterView(), isActive: $shouldShowRegister) {
                                EmptyView()
                            }
                        )
                    }
                    .padding(21)
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
            
            SecureField("Password", text: $pass)
                .frame(height: 44)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(5)
                .padding(.horizontal, 21)
            
        }
    }
   
    
    // Llamada a la petición de NetworkHelper que pronto pasaremos a viewModel
    func login(email: String, pass: String) {
        
        //baseUrl + endpoint
        let url = "https://superapi.netlify.app/api/login"
        
        //params
        let dictionary: [String: Any] = [
            "user" : email,
            "pass" : pass
        ]
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
            if let error = error {
                onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    onSuccess()
                } else { // esto daria error
                    onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    
    func onSuccess() {
        // Navegación hacia la vista de Agenda
        shouldShowAgenda = true
    }
    
    func onError(error: String) {
        print(error)
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
    
    // ESTE NO SE ESTA UTILIZANDO
    var loginButton: some View {
        Button {
            // TODO: - Login Request
            login(email: email, pass: pass)
        } label: {
            Text("Login")
                .foregroundColor(.white)
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(5)
                .padding(.horizontal, 21)

        }
//        .background(
//            NavigationLink(destination: RegisterView(), isActive: $shouldShowRegister) {
//                EmptyView()
//            }
//        )
    }
    
    // Esta es otra manera de extraer las vistas, funciona exactamente igual que la var << loginButton: some View >>, no se esta llamando/utilizando pero la dejo aquí para que sepais ambas maneras.
    func loginButton(title: String) -> some View {
        Button {
            // Call login action
            login(email: email, pass: pass)
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
            NavigationLink(destination: AgendaView(), isActive: $shouldShowAgenda) {
                EmptyView()
            }
        )
    }
}
