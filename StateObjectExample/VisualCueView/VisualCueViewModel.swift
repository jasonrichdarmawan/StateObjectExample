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

class VisualCueViewModel: ObservableObject {
    var buttonHighlightVM: [VisualCueKey: ButtonHighlightViewModel] = [:]
    
    init() {
        buttonHighlightVM[.next] = ButtonHighlightViewModel(action: {}, label: "next")
        buttonHighlightVM[.previous] = ButtonHighlightViewModel(action: {}, label: "previous")
    }
    
    deinit {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
}
