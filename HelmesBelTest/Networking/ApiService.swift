//
//  ApiService.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

enum Result<T: Decodable> {
  case success(T)
  case failure(Error)
}

final class ApiService {
  
  static let `default` = ApiService()
  private let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
  private init() {}
  
  func perform<T: Decodable>(_ request: URLRequest, completion: @escaping (Result<T>) -> Void) {
    session.dataTask(with: request) { (data, _, error) in
      guard error == nil else {return completion(.failure(error!))}
      guard let data = data else {return completion(.failure(ApiError.noData))}
      do {
        let result: T = try ResponseDecoder.decode(from: data)
        completion(.success(result))
      } catch {
        completion(.failure(ApiError.unknownResponseFormat))
      }
    }.resume()
  }
}
