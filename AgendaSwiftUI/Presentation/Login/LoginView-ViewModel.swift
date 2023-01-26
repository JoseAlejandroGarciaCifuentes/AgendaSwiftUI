//
//  LoginView-ViewModel.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 26/1/23.
//

import Foundation

extension LoginView {
    class ViewModel: ObservableObject {
        @Published var shouldShowAgenda: Bool = false
        @Published var shouldShowErrorAlert: Bool = false
        
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
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 { // esto daria ok
                        self.onSuccess()
                    } else { // esto daria error
                        self.onError(error: error?.localizedDescription ?? "Request Error")
                    }
                }
            }
        }
        
        func onSuccess() {
            // Navegación hacia la vista de Agenda
            shouldShowAgenda = true
        }
        
        func onError(error: String) {
            shouldShowErrorAlert = true
        }
    }
}
