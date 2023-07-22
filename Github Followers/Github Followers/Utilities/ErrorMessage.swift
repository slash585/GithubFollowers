//
//  ErrorMessage.swift
//  Github Followers
//
//  Created by Mehmet Ali Özdemir on 22.07.2023.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created in invalid request. Please try again."
    case unableToComplate = "Unable to complate your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again."
}
