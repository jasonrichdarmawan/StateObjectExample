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
    @available(*, deprecated, message: "use getBook(id: UInt32, completion: @escaping ((entity: BookEntity?, count: UInt32)) -> Void")
    func getBook(id: UInt32) async -> (entity: BookEntity?, count: UInt32?)
    func getBook(id: UInt32, completion: @escaping ((entity: BookEntity?, count: UInt32?)) -> Void)
}

class GetBookUseCaseImpl: GetBookuseCase {
    private let repository: BookRepository
    
    init(repository: BookRepository) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        self.repository = repository
    }
    
    func getBook(id: UInt32) async -> (entity: BookEntity?, count: UInt32?) {
        return await repository.getBook(id: id)
    }
    
    func getBook(id: UInt32, completion: @escaping ((entity: BookEntity?, count: UInt32?)) -> Void) {
        var result: ((entity: BookEntity?, count: UInt32?))

        repository.getBook(id: id, completion: { response in
            result = response
        })
        
        completion(result)
    }
}
