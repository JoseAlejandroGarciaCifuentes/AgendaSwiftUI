//
//  RegisterView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 12/1/23.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var pass: String = ""
    
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
                
                TextField("Password", text: $pass)
                    .frame(height: 44)
                    .padding(.horizontal, 10)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.horizontal, 21)
                
                Spacer()
                
                KingsLeagueImageView()
                
                
                Button {
                    // TODO: - Register Action
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
