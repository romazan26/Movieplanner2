//
//  CustomTextFieldView.swift
//  Movieplanner
//
//  Created by Роман on 07.06.2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack {
            Color.tougleback
            TextField(placeholder, text: $text)
                .padding()
        }
        .cornerRadius(12)
        .frame(maxWidth: .infinity)
            .frame(height: 69)
    }
}

#Preview {
    CustomTextFieldView(placeholder: "Film title", text: .constant(""))
}
