//
//  ButtonHighlight.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct ButtonHighlight: View {
    /// - TODO: adhere to Dependency inversion Principle
    /// The Dependency Inversion Principle (DIP) states that high level modules should not depend on low level modules; both should depend on abstractions.
    /// Abstractions should not depend on details. Details should depend upon abstractions.
    @StateObject var state: ButtonHighlightViewModel
    
    init(action: @escaping () -> Void, label: String) {
#if DEBUG
        print("\(type(of: self)) \(#function) \(label)")
#endif
        self._state = StateObject(wrappedValue: ButtonHighlightViewModel(action: action, label: label))
    }
    
    init(vm: ButtonHighlightViewModel) {
#if DEBUG
        print("\(type(of: self)) \(#function) \(vm.label)")
#endif
        self._state = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        let cornerRadius = CGFloat(10)
        
        return Button(
            action: {
                state.action()
            },
            label: {
                Text(state.label)
            }
        )
        .padding(8)
        .background(state.isHighlighted ? .yellow : .clear)
        .cornerRadius(cornerRadius)
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.blue, lineWidth: 2)
        }
        .onAppear {
#if DEBUG
            print("\(type(of: self)) \(#function) \(state.label) appeared")
#endif
        }
        .onDisappear() {
#if DEBUG
            print("\(type(of: self)) \(#function) \(state.label) disappeared")
#endif
        }
    }
}
