//
//  Button.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 03/07/23.
//

import Foundation

class ButtonViewModel: ViewModel {
    var action: () -> Void {
        get {
            return {
                self.actionClosure()
            }
        }
        set {
            actionClosure = newValue
        }
    }
    
    @Published var label: String = ""
    
    init(action: @escaping () -> Void, label: String) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        super.init()
        
        self.action = action
        self.label = label
    }
    
    init(label: String) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        self.label = label
    }
    
    private var actionClosure: () -> Void = {
        fatalError("\(#function) Not Implemented")
    }
}
