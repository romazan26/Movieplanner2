//
//  ViewModel.swift
//  Movieplanner
//
//  Created by Роман on 03.06.2024.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var films: [Film] = []
    
}
