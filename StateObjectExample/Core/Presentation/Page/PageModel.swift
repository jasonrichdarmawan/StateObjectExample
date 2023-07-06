//
//  PageModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct PageModel<Page: View> {
    var currentPage = 0
    let pages: [Page]
    
    init(pages: [Page]) {
        self.pages = pages
    }
}
