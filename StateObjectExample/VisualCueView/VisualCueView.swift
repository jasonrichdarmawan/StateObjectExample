//
//  TranscriberView.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct VisualCueView<Page: View>: View {
    @ObservedObject var vm: VisualCueViewModel
    @ObservedObject var pager: PageViewModel<Page>
    
    init(vm: VisualCueViewModel, pager: PageViewModel<Page>) {
        self.vm = vm
        self.pager = pager
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    var body: some View {
        HStack {
            if !pager.beginningOfPage() {
                ButtonHighlight(vm: vm.buttonHighlightVM[.previous]! as! ButtonHighlightViewModel)
            }
            if !pager.endOfPage() {
                ButtonHighlight(vm: vm.buttonHighlightVM[.next]! as! ButtonHighlightViewModel)
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
