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
    var buttonVM: [VisualCueKey: ButtonViewModel] = [:]
    
    init(buttonVM: [VisualCueKey: ButtonViewModel]) {
        self.buttonVM = buttonVM
    }
}
