//
//  VisualCueViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/06/23.
//

import Foundation

enum VisualCueKey {
    case next
    case previous
}

class VisualCueViewModel: ViewModel {
    var buttonHighlightVM: [VisualCueKey: ButtonViewModel] = [:]
    
    /// TODO: adhere to Dependency Inversion Principle
    override init() {
        buttonHighlightVM[.next] = ButtonHighlightViewModel(action: {}, label: "next")
        buttonHighlightVM[.previous] = ButtonHighlightViewModel(action: {}, label: "previous")
    }
}
