//
//  SignInModel.swift
//  Rangoo
//
//  Created by coltec on 13/06/23.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
