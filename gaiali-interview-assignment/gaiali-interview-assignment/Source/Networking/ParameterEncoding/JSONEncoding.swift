//
//  URLEncoding.swift
//
//  Copyright (c) 2014-2018 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Source code modified by: Igor Drljic

import Foundation

/// Uses `JSONSerialization` to create a JSON representation of the parameters object, which is set as the body of the
/// request. The `Content-Type` HTTP header field of an encoded request is set to `application/json`.
struct JSONEncoding: ParameterEncoding {
    // MARK: Properties
    /// Returns a `JSONEncoding` instance with default writing options.
    static var `default`: JSONEncoding { JSONEncoding() }

    /// Returns a `JSONEncoding` instance with `.prettyPrinted` writing options.
    static var prettyPrinted: JSONEncoding { JSONEncoding(options: .prettyPrinted) }

    /// The options for writing the parameters as JSON data.
    let options: JSONSerialization.WritingOptions

    // MARK: Initialization
    /// Creates an instance using the specified `WritingOptions`.
    ///
    /// - Parameter options: `JSONSerialization.WritingOptions` to use.
    init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }

    // MARK: Encoding
    func encode(_ urlRequest: URLRequest, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = urlRequest

        guard let parameters = parameters else {
            return urlRequest
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: options)

            if urlRequest.allHTTPHeaderFields == nil {
                urlRequest.allHTTPHeaderFields = [:]
            }
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }

            urlRequest.httpBody = data
        } catch {
            throw NetworkError.jsonEncodingFailed(error: error)
        }

        return urlRequest
    }

    /// Encodes any JSON compatible object into a `URLRequest`.
    ///
    /// - Parameters:
    ///   - urlRequest: `URLRequestConvertible` value into which the object will be encoded.
    ///   - jsonObject: `Any` value (must be JSON compatible` to be encoded into the `URLRequest`. `nil` by default.
    ///
    /// - Returns:      The encoded `URLRequest`.
    /// - Throws:       Any `Error` produced during encoding.
    func encode(_ urlRequest: URLRequest, withJSONObject jsonObject: Any? = nil) throws -> URLRequest {
        var urlRequest = urlRequest

        guard let jsonObject = jsonObject else {
            return urlRequest
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: options)

            if urlRequest.allHTTPHeaderFields == nil {
                urlRequest.allHTTPHeaderFields = [:]
            }
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }

            urlRequest.httpBody = data
        } catch {
            throw NetworkError.jsonEncodingFailed(error: error)
        }

        return urlRequest
    }
}
