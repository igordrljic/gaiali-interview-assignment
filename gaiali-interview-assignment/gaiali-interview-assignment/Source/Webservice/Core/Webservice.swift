//
//  WebService.swift
//
//  Created by Igor Drljic on 7/1/21.
//

import Foundation

protocol Webservice {
    var baseUrl: URL { get }
    var decoding: ResponseDecoding { get }
}
