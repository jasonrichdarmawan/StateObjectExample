//
//  ButtonHighlightViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import Foundation

class ButtonHighlightViewModel: ObservableObject {
    let label: String
    @Published var isHighlighted: Bool = false
    
    init(_ label: String) {
        self.label = label
    }
}
