//
//  SignInViewModel.swift
//  Rangoo
//
//  Created by coltec on 13/06/23.
//

import Foundation
import Firebase
import Combine
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

class SignInViewModel: ObservableObject {
    
    @Published var _CLIENT_CODE: String = ""
    
    
    
    private var cancellable: AnyCancellable?
    private var cancellableRequest: AnyCancellable?
    //private let publisher: PassthroughSubject<Bool, Never>()
    
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var uiState: SignInUIState = .none
    
    func loginGoogleUser(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController){ user, erro in
            
            if let error = erro {
                print(error.localizedDescription)
                return
            }
            
            guard let user = user?.user, let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { res, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = res?.user else { return }
                print(user)
            }
            
        }
        
    }
    
    
}

