//
//  VisualCueViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 29/06/23.
//

import Foundation

class VisualCueViewModel: ObservableObject {
    var buttonHighlightVM: [String: ButtonHighlightViewModel] = [:]
    
    init() {
        buttonHighlightVM["next"] = ButtonHighlightViewModel("next")
        buttonHighlightVM["back"] = ButtonHighlightViewModel("back")
    }
}
