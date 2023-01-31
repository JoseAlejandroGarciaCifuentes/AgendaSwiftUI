//
//  LoginView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 10/1/23.
//

import SwiftUI

struct LoginView: View {
    
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    @State private var email: String = ""
    @State private var pass: String = ""
    @State private var shouldShowRegister: Bool = false
    
    @State private var isOlderThan14: Bool = true
    
    // Computed property
    var title: String {
        
        // Es lo mismo que la condicion ternaria de abajo
        //        if isOlderThan14 {
        //            return "Older"
        //        } else {
        //            return "Younger"
        //        }
        
        return isOlderThan14 ? "Older" : "Younger"
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                // esta vista es publica, se reutiliza
                BackgroundColorView()
                
                VStack {
                    TitleView(title: title)
                    
                    textFields()
                    
                    Spacer()
                    
                    KingsLeagueImageView()
                        .padding(.bottom, 30)
                    
                    Spacer()
                    
                    loginButton(title: "Login")
                    
                    HStack {
                        Text("Haven't got an account yet?")
                            .foregroundColor(.black)
                            .font(.system(size: isOlderThan14 ? 17 : 14)) // Inline condition / Ternario
                        
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
        .alert("Login Error", isPresented: $viewModel.shouldShowErrorAlert, actions: {
            Button {
                // Esta acción no ejecuta nada, en caso de querer añadir una acción cuando se pulsa el botón de Ok se podría poner aquí
            } label: {
                Text("Ok")
            }
        }) {
            Text("Your login user and pass were not correct")
        }
    }
    
    @ViewBuilder var textFieldsYounger: some View {
        if isOlderThan14 {
            Text("")
        }
    }
    
    
    // MARK: - Accessory Views
    
    // Esta vista se puede sacar a la Extension de abajo pero está aqui para que sepais que tambien se puede quedar dentro del struct
    func textFields() -> some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never) // esto quita mayuscula inicial en el TextField
                .customDesign()
                
            
            SecureField("Password", text: $pass)
                .font(.system(size: 13))
                .customDesign()
            
            if !isOlderThan14{
                TextField("Name for kids", text: $pass)
                    .font(.system(size: 13))
                    .customDesign()
            }
        }
    }
    
    
    // Esta es otra manera de extraer las vistas, funciona exactamente igual que la var << loginButton: some View >>, no se esta llamando/utilizando pero la dejo aquí para que sepais ambas maneras.
    func loginButton(title: String) -> some View {
        Button {
            // Call login action
            viewModel.login(email: email, pass: pass)
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
            NavigationLink(destination: AgendaView(), isActive: $viewModel.shouldShowAgenda) {
                EmptyView()
            }
        )
    }
    
}


//MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
