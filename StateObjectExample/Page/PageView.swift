//
//  PageView.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    @ObservedObject var vm: PageViewModel<Page>
    
    init(vm: PageViewModel<Page>) {
        self.vm = vm
        
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    var body: some View {
        HStack {
            if !vm.beginningOfPage() {
                Button(
                    action: { _ = vm.previousPage() },
                    label: { Text("<") }
                )
            }
            vm.model.pages[vm.model.currentPage]
            if !vm.endOfPage() {
                Button(
                    action: { _ = vm.nextPage() },
                    label: { Text(">")}
                )
            }
        }
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
