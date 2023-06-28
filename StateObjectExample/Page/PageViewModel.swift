//
//  PageViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

class PageViewModel<Page: View>: ObservableObject {
    @Published var model: PageModel<Page>
    
    init(pages: [Page]) {
        self.model = PageModel(pages: pages)
        
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    func endOfPage() -> Bool {
        return model.currentPage + 1 == model.pages.count
    }
    
    func beginningOfPage() -> Bool {
        return model.currentPage == 0
    }
    
    func nextPage() -> Bool {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        if endOfPage() {
            return false
        }
        
        model.currentPage += 1
        return true
    }
    
    func previousPage() -> Bool {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        if beginningOfPage() {
            return false
        }
        
        model.currentPage -= 1
        return true
    }
}
