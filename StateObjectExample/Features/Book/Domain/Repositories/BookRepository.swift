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
    func getBook(id: UInt32) async -> (entity: BookEntity?, count: UInt32?)
}
