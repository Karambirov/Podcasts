//
//  SearchService.swift
//  Podcasts
//
//  Created by Eugene Karambirov on 04.07.2020.
//

import Foundation

protocol SearchServiceProtocol {
    associatedtype Response
    associatedtype Error: Swift.Error

    func search<T: MediaType>(
        for type: T.Type,
        with term: String,
        completion: @escaping (Result<Response, Error>) -> Void
    )
}

final class SearchService<T: MediaType> {
    private let session: URLSession

    enum Error: Swift.Error {
        case networking(error: Swift.Error?, response: URLResponse?)
        case decoding(error: Swift.Error)
        case creatingURL
    }

    struct Response: Decodable {
        let results: [Podcast]
    }

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension SearchService: SearchServiceProtocol {
    func search<T: MediaType>(
        for type: T.Type,
        with term: String,
        completion: @escaping (Result<Response, Error>) -> Void
    ) {
        let components = AppleiTunesSearchURLComponents<T>(term: term)
        guard let url = components.url else {
            print("Error creating URL")
            completion(.failure(.creatingURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.networking(error: error, response: response)))
                return
            }

            do {
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(SearchService.Response.self, from: data)
                completion(.success(searchResponse))
            } catch {
                completion(.failure(.decoding(error: error)))
            }
        }.resume()
    }
}
