//
//  SignInViewModel.swift
//  Rangoo
//
//  Created by coltec on 13/06/23.
//

import Foundation
import Combine
import SwiftUI

class SignInViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    private var cancellableRequest: AnyCancellable?
    //private let publisher: PassthroughSubject<Bool, Never>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var uiState: SignInUIState = .none
    
    
}
