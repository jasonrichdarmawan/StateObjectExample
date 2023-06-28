//
//  TranscriberView.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct VisualCueView<Page: View>: View {
    @ObservedObject var pager: PageViewModel<Page>
    
    init(pager: PageViewModel<Page>) {
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
                    label: "previous"
                )
            }
            if !pager.endOfPage() {
                ButtonHighlight(
                    action: { _ = pager.nextPage() },
                    label: "next"
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
