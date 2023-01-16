//
//  RegisterView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 12/1/23.
//

import SwiftUI

struct RegisterView: View {
    
    // MARK: - Private Properties
    
    @State private var email: String = ""
    @State private var pass: String = ""
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            BackgroundColorView()
            
            VStack(spacing: 20) {
                TitleView(title: "Register")
                
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
                
                Spacer()
                
                KingsLeagueImageView()
                
                
                Button {
                    // TODO: - Register Action
                    register(email: email, pass: pass)
                } label: {
                    Text("Register")
                        .foregroundColor(.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(5)
                        .padding(.horizontal, 21)
                }
                
                
            }
        }
        // Estas dos lineas sirven para esconder el nav bar de arriba en caso de que quisieseis hacerlo
        //.navigationBarBackButtonHidden(true)
        //.navigationTitle(Text(""))
    }
    
    // MARK: - Private Methods
    
    // Llamada a la petición de NetworkHelper que pronto pasaremos a viewModel
    private func register(email: String, pass: String) {
        
        //baseUrl + endpoint
        let url = "https://superapi.netlify.app/api/register"
        
        //params
        let dictionary: [String: Any] = [
            "user" : email,
            "pass" : pass
        ]
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                print(response.statusCode)
                print(String(bytes: data, encoding: .utf8))
            }
        }
    }
}


// MARK: - Previews

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
