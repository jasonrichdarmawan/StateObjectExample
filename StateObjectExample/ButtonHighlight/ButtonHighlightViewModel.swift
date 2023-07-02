//
//  ButtonHighlightViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import Foundation

class ButtonHighlightViewModel: ButtonViewModel {
    override var action: () -> Void {
        get {
            return {
                self.isHighlighted = true
                super.action()
            }
        }
        set {
            super.action = newValue
        }
    }
    
    @Published private(set) var isHighlighted: Bool = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isHighlighted = false
            }
        }
    }
}
