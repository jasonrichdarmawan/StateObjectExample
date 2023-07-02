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
        let pagerVM = ContentViewModel.createPageViewModel()
        
        let visualCueVM = VisualCueViewModel(buttonVM: ContentViewModel.createButtonVM(pagerVM: pagerVM))
        
        let listernerVM = ContentViewModel.createListenerVM(visualCueVM: visualCueVM)
        
        self.pagerVM = pagerVM
        self.visualCueVM = visualCueVM
        self.listenerVM = listernerVM
        
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    private static func createBookModels() -> [BookModel] {
        return [
            BookModel(title: "Title 1", summary: "Summary 1"),
            BookModel(title: "Title 2", summary: "Summary 2"),
            BookModel(title: "Title 3", summary: "Summary 3"),
            BookModel(title: "Title 4", summary: "Summary 4")
        ]
    }
    
    private static func createPageViewModel() -> PageViewModel<BookView> {
        return PageViewModel(
            pages: ContentViewModel.createBookModels().map { model in
                BookView(vm: BookViewModel(model: model))
            }
        )
    }
    
    private static func createButtonVM(pagerVM: PageViewModel<BookView>) -> [VisualCueKey: ButtonViewModel] {
        return [
            .next : ButtonHighlightViewModel(action: { _ = pagerVM.nextPage() }, label: "next"),
            .previous : ButtonHighlightViewModel(action: { _ = pagerVM.previousPage() }, label: "previous")
        ]
    }
    
    private static func createListenerVM(visualCueVM: VisualCueViewModel) -> ListenerViewModel {
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
        
        return listener
    }
}
