//
//  PageViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

class PageViewModel: ViewModel {
    private var _currentPage: UInt32?
    
    /// expected minimum value is 1
    var currentPage: UInt32? {
        get {
            return _currentPage
        }
        set {
            let value: UInt32 = {
                guard let newValue else {
                    return 1
                }
                
                if newValue < 1 {
                    return 1
                }
                
                return newValue
            }()
            _currentPage = value
            objectWillChange.send()
        }
    }
    
    /// how many pages are in the data source?
    var count: UInt32?
    
    func isBeginningOfPage() -> Bool {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        if currentPage == 1 {
            return true
        }
        
        return false
    }
    
    func isEndOfPage() -> Bool {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        if currentPage == count {
            return true
        }
        
        return false
    }
    
    func nextPage() -> Bool {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        if isEndOfPage() {
            return false
        }
        
        currentPage? += 1
        
        return true
    }
    
    func previousPage() -> Bool {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        if isBeginningOfPage() {
            return false
        }
        
        currentPage? -= 1
        
        return true
    }
}
