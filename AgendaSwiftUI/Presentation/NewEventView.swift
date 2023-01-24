//
//  NewEventView.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 20/1/23.
//

import SwiftUI

struct NewEventView: View {
    @State var dateSelected: Date = Date()
    @Binding var shouldShowNewEvent: Bool
    var completion: () -> () = {}
    
    var body: some View {
        DatePicker("", selection: $dateSelected, displayedComponents: .date)
            .datePickerStyle(.graphical)
            .background(Color.white)
            .cornerRadius(5)
            .padding(.horizontal, 10)
        
        Button {
            postEvent()
        } label: {
            Text("Go Back and update")
        }

    }
    
    func postEvent() {
        let dateConverted = convertDateToInt(date: dateSelected)
    }
    
    // Convertimos de Date a Int
    func convertDateToInt(date: Date) -> Int {
        return Int(date.timeIntervalSince1970)
    }
    
    func onSuccess() {
        //Avisaria a la vista anterior de que ha hecho lo que tenia que hacer
        completion()
        //cerrar esta vista
        shouldShowNewEvent = false
    }
}

struct NewEventView_Previews: PreviewProvider {
    static var previews: some View {
        NewEventView(shouldShowNewEvent: .constant(true))
    }
}
