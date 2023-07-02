//
//  ContentViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct ContentViewModel {
    var pagerVM: PageViewModel<BookView>
    var visualCueVM: VisualCueViewModel
    
    var listenerVM: ListenerViewModel
    
    init() {
        let models = [
            BookModel(title: "Title 1", summary: "Summary 1"),
            BookModel(title: "Title 2", summary: "Summary 2"),
            BookModel(title: "Title 3", summary: "Summary 3"),
            BookModel(title: "Title 4", summary: "Summary 4")
        ]
        
        let pager = PageViewModel(
            pages: models.map { model in
                BookView(vm: BookViewModel(model: model))
            }
        )
        
        var buttonVM: [VisualCueKey: ButtonViewModel] = [:]
        buttonVM[.next] = ButtonHighlightViewModel(action: { _ = pager.nextPage() }, label: "next")
        buttonVM[.previous] = ButtonHighlightViewModel(action: { _ = pager.previousPage() }, label: "previous")
        
        let visualCueVM = VisualCueViewModel(buttonVM: buttonVM)
        
        let listener = ListenerViewModel()
        
        listener.onSend = { key in
            switch key {
            case .next:
                if let vm = visualCueVM.buttonVM[.next] {
                    vm.action()
                }
            case .previous:
                if let vm = visualCueVM.buttonVM[.previous] {
                    vm.action()
                }
            case .destroy:
                if let vm = visualCueVM.buttonVM[.next] {
                    vm.action = {}
                    vm.label = "destroyed"
                }
                if let vm = visualCueVM.buttonVM[.previous] {
                    vm.action = {}
                    vm.label = "destroyed"
                }
            }
            
            return true
        }
        
        self.pagerVM = pager
        self.visualCueVM = visualCueVM
        self.listenerVM = listener
        
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
}
