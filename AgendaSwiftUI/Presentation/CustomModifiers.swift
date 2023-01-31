//
//  CustomModifiers.swift
//  AgendaSwiftUI
//
//  Created by Alejandro Garcia on 31/1/23.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 44)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(5)
            .padding(.horizontal, 21)
    }
}

struct CustomFont: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .thin))
    }
}

extension View {
    func customDesign() -> some View {
        self.modifier(TextFieldModifier())
    }
    
    func font(size: CGFloat) -> some View {
        self.modifier(CustomFont(size: size))
    }
    
}


