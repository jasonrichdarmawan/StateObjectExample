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
                ButtonHighlight(
                    action: { _ = pager.previousPage() },
                    vm: vm.buttonHighlightVM["back"] ?? ButtonHighlightViewModel("back")
                )
            }
            if !pager.endOfPage() {
                ButtonHighlight(
                    action: { _ = pager.nextPage() },
                    vm: vm.buttonHighlightVM["next"] ?? ButtonHighlightViewModel("next")
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
