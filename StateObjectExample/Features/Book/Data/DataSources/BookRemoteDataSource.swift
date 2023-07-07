//
//  BookRemoteDataSource.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

class BookRemoteDataSource: BookDataSource {
    func getBook(id: UInt32) async -> GetBookModel? {
        let response = await getBooks(id: id)
        
        let data = response?.data?.first(where: { $0.id == String(id) })
        let meta = GetBookModel.MetaModel(count: response?.meta?.count)
        let getBookModel = GetBookModel(data: data, meta: meta)
        return getBookModel
    }
    
    func getBook(id: UInt32, completion: @escaping (GetBookModel?) -> Void) {
        getBooks(id: id, completion: { result in
            let data = result?.data?.first(where: { $0.id == String(id) })
            let meta = GetBookModel.MetaModel(count: result?.meta?.count)
            let getBookModel = GetBookModel(data: data, meta: meta)
            completion(getBookModel)
            return
        })
    }
}

extension BookRemoteDataSource {
    private func getBooks(id: UInt32) async -> GetBooksModel? {
#if DEBUG
        sleep(2)
#endif
        guard let url = URL(string: "https://raw.githubusercontent.com/jasonrichdarmawan/StateObjectExampleRemoteDataSource/main/api/getbooks.json") else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(GetBooksModel.self, from: data)
            return response
        } catch {
            print("\(type(of: self)) \(#function) Error fetching or decoding JSON: \(error)")
            return nil
        }
    }
    
    private func getBooks(id: UInt32, completion: @escaping (GetBooksModel?) -> Void) {
#if DEBUG
        sleep(2)
#endif
        guard let url = URL(string: "https://raw.githubusercontent.com/jasonrichdarmawan/StateObjectExampleRemoteDataSource/main/api/getbooks.json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(GetBooksModel.self, from: data)
            completion(response)
            return
        } catch {
            print("\(type(of: self)) \(#function) Error fetching or decoding JSON \(error)")
            return
        }
    }
}
