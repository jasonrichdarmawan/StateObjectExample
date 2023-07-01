//
//  ContentView.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()
    
    init() {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("PageView")
                PageView(vm: vm.pagerVM)
            }
            VStack {
                Text("VisualCueView")
                VisualCueView(vm: vm.visualCueVM, pager: vm.pagerVM)
            }
            
            VStack {
                Text("user input to ListenerViewModel")
                HStack {
                    ButtonHighlight(
                        action: { _ = vm.listenerVM.send(.previous) },
                        label: "previous"
                    )
                    ButtonHighlight(
                        action: { _ = vm.listenerVM.send(.next) },
                        label: "next"
                    )
                    ButtonHighlight(
                        action: { _ = vm.listenerVM.send(.destroy)},
                        label: "destroy"
                    )
                }
            }
        }
        .padding()
        .onAppear {
#if DEBUG
            print("\(type(of: self)) \(#function) appeared")
#endif
        }
        .onDisappear {
#if DEBUG
            print("\(type(of: self)) \(#function) disappeared")
#endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
