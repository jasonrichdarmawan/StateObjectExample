//
//  GetBookUseCase.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

protocol GetBookuseCase {
    /// - Parameters:
    ///     - count: how many books are there in the data source?
    func getBook(id: UInt32) -> (entity: BookEntity?, count: UInt32?)
}

class GetBookUseCaseImpl: GetBookuseCase {
    private let repository: BookRepository
    
    init(repository: BookRepository) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        self.repository = repository
    }
    
    func getBook(id: UInt32) -> (entity: BookEntity?, count: UInt32?) {
        return repository.getBook(id: id)
    }
}
