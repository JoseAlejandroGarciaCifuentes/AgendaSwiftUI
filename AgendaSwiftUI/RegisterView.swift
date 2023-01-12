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
            Color.gray
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Register")
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
                    // TODO: - Login Action
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
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
