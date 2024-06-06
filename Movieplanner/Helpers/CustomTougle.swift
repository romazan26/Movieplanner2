//
//  CustomTougle.swift
//  Movieplanner
//
//  Created by Роман on 06.06.2024.
//

import Foundation
import SwiftUI

struct CustonToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        
        return ZStack{
            RoundedRectangle(cornerRadius: 46)
                .foregroundStyle(Color(.tougleback))
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 46)
                    .foregroundStyle(isOn ? .button : .clear)
                    Text("Viewed")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(isOn ? .white : .gray)
                }
                .frame(width: 90, height: 36)
                .onTapGesture {
                    configuration.isOn = true
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        
                    .foregroundStyle(!isOn ? .button : .clear)
                    Text("Queue")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(isOn ? .white : .gray)
                }
                .frame(width: 90, height: 36)
                .onTapGesture {
                    configuration.isOn = false
                }
            }
        }
        .animation(.easeIn, value: isOn)
        .frame(width: 176, height: 40)
        
    }
}
