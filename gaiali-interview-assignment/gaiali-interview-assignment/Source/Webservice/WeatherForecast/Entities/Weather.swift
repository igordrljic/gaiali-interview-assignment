//
//  Weather.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import Foundation

typealias WeatherID = Int

struct Weather: Decodable {
    let id: WeatherID
    let main: String
    let description: String
    let icon: String
}

import UIKit

extension Weather {
    var iconUrl: URL {
        let imageRepoUrl = AppConfig.shared.imageRepositoryURL
        let imageCode = "\(icon)@2x.png"
        return imageRepoUrl.appendingPathComponent(imageCode)
    }
}
