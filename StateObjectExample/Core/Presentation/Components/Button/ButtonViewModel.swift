//
//  Button.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 03/07/23.
//

import Foundation

class ButtonViewModel: ViewModel {
    
    /// - `public action` - `private actionClosure` pattern
    ///     - It listen everytime `var action` is getted and setted.
    ///     - By listening, you can do something before, after `var action` is getted and setted.
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
        
        self.actionClosure = action
        self.label = label
    }
    
    init(label: String) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        self.label = label
    }
    
    private var actionClosure: () -> Void = {
#if DEBUG
        assertionFailure("\(#function) Not implemented")
#endif
    }
}
