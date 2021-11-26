//
//  Network.swift
//
//  Created by Igor Drljic on 30/05/2021.
//

import Foundation
import Combine

class Network {
    static let shared = Network()
    private let urlSession: URLSession
    private let requestRetryCount: Int
    private let completionQueue: DispatchQueue
    private var subscribers = [Request: AnyCancellable]()
    
    init(urlSession: URLSession = URLSession.shared,
         requestRetryCount: Int = 1,
         completionQueue: DispatchQueue = .main) {
        self.urlSession = urlSession
        self.requestRetryCount = requestRetryCount
        self.completionQueue = completionQueue
    }
    
    func run<ResultType: Decodable>(_ request: Request, completion: @escaping (Result<ResultType, Error>) -> Void) {
        do {
            let urlRequest = try request.urlRequest()
            subscribers[request] = urlSession.dataTaskPublisher(for: urlRequest)
                .retry(requestRetryCount)
                .tryMap({ data, response -> ResultType in
                    try self.validate(response, data)
                    return try request.decoding.decode(data)
                })
                .receive(on: completionQueue)
                .sink { subscribersCompletion in
                    if case let .failure(error) = subscribersCompletion {
                        completion(.failure(error))
                        self.subscribers.removeValue(forKey: request)
                    }
                } receiveValue: { result in
                    completion(.success(result))
                    self.subscribers.removeValue(forKey: request)
                }
        } catch {
            completion(.failure(error))
        }
    }
    
    func run(_ request: Request, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let urlRequest = try request.urlRequest()
            subscribers[request] = urlSession.dataTaskPublisher(for: urlRequest)
                .retry(requestRetryCount)
                .tryMap({ data, response -> Void in
                    try self.validate(response, data)
                    return ()
                })
                .receive(on: completionQueue)
                .sink { subscribersCompletion in
                    if case let .failure(error) = subscribersCompletion {
                        completion(.failure(error))
                        self.subscribers.removeValue(forKey: request)
                    }
                } receiveValue: { result in
                    completion(.success(result))
                    self.subscribers.removeValue(forKey: request)
                }
        } catch {
            completion(.failure(error))
        }
    }
    
    func cancel(_ request: Request) {
        guard let cancelable = subscribers[request] else {
            return
        }
        subscribers.removeValue(forKey: request)
        cancelable.cancel()
    }
        
    private func validate(_ response: URLResponse, _ data: Data) throws {
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw NetworkError.responseError(code: httpResponse.statusCode, data: data)
        }
    }
}
