//
//  ButtonHighlight.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct ButtonHighlight: View {
    @StateObject var state: ButtonHighlightViewModel
    
    var onAction: () -> Void
    
    init(action: @escaping () -> Void, label: String) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        self.onAction = action
        self._state = StateObject(wrappedValue: ButtonHighlightViewModel(label))
    }
    
    init(action: @escaping () -> Void, vm: ButtonHighlightViewModel) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        self.onAction = action
        self._state = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        let cornerRadius = CGFloat(10)
        
        return Button(
            action: {
                state.isHighlighted = true
                onAction()
            },
            label: {
                Text(state.label)
            }
        )
        .foregroundColor(.black)
        .padding(8)
        .background(state.isHighlighted ? .yellow : .clear)
        .cornerRadius(cornerRadius)
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.blue, lineWidth: 2)
        }
        .onAppear {
#if DEBUG
            print("\(type(of: self)) \(#function) appeared")
#endif
        }
        .onDisappear() {
#if DEBUG
            print("\(type(of: self)) \(#function) disappeared")
#endif
        }
    }
}
