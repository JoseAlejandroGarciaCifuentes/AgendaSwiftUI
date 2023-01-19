//
//  AgendaView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 19/1/23.
//

import SwiftUI

// Modelo que utilizaremos para convertir tras recogerlo de la petición
struct EventResponseModel: Decodable {
    let name: String?
    let date: Int?
}

// Modelo de vista que utilizaremos para mostrar los datos en la view
struct EventPresentationModel {
    let name: String
    let date: Int
}


struct AgendaView: View {
    @State var dateSelected: Date = Date()
    @State var events: [EventPresentationModel] = []
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Agenda")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 20)
                
                // Picker de fecha, tiene una var @State "dateSelected" donde se guardará el valor al pulsar en el calendario
                DatePicker("", selection: $dateSelected, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.horizontal, 10)
                
                Spacer()
            }
        }
        // Ciclo de vida de la vista, al crearse se hace la petición de eventos
        .onAppear {
            getEvents()
        }
    }
    
    
    func getEvents() {
        
        //baseUrl + endpoint
        let url = "https://superapi.netlify.app/api/db/eventos"
        
        // petición
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            if let error = error {
                onError(error: error.localizedDescription)
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 { // esto daria ok
                    onSuccess(data: data)
                } else { // esto daria error
                    onError(error: error?.localizedDescription ?? "Request Error")
                }
            }
        }
    }
    
    
    func onSuccess(data: Data) {
        do {
            // Convertimos a modelo de Data los datos que nos llegan
            let eventsNotFiltered = try JSONDecoder().decode([EventResponseModel?].self, from: data)
            
            // Recogemos únicamente los que no son nil y además lo convertimos a modelo de vista
            self.events = eventsNotFiltered.compactMap({ eventNotFiltered in
                // Comprobamos que la fecha no sea nil, en caso de serlo devolvera un nil por lo que no se guardarñá
                guard let date = eventNotFiltered?.date else { return nil }
                // se crea el objecto de vista con el nombre del evento que en caso de que venga nulo le pondremos un nombre por defecto y la fecha que hemos comprobado que NO será nil
                return EventPresentationModel(name: eventNotFiltered?.name ?? "Empty Name", date: date)
            })
        } catch {
            self.onError(error: error.localizedDescription)
        }
        
    }
    
    func onError(error: String) {
        print(error)
    }
}

struct AgendaView_Previews: PreviewProvider {
    static var previews: some View {
        AgendaView()
    }
}
