//
//  BookRepository.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

protocol BookRepository {
    /// - Parameters:
    ///     - count: how many books are there in the data source?
    /// - TODO: handle error
    func getBook(id: UInt32) async -> (entity: BookEntity?, count: UInt32?)
    @available(*, deprecated, message: "use getBook(id: UInt32) async -> (entity: BookEntity?, count: UInt32)")
    func getBook(id: UInt32, completion: @escaping ((entity: BookEntity?, count: UInt32?)) -> Void)
}
