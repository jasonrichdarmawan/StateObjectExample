//
//  BookDataSource.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 06/07/23.
//

import Foundation

protocol BookDataSource {
    /// - TODO: asynchronous
    func getBook(id: UInt32) -> GetBookModel?
}
