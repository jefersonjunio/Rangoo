//
//  SignInView.swift
//  Rangoo
//
//  Created by coltec on 13/06/23.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import Firebase
import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel

    @State var action: Int? = 0
    
    @State var navigationBarHidden = true
    
    var body: some View {
        ZStack{
            if case SignInUIState.goToHomeScreen = viewModel.uiState{
                //TODO: Implementar redirecionamento para Home Screen
            }else{
                NavigationView{
                    ScrollView{
                        VStack(alignment: .center){
                            
                            Image("logo") // TODO: Criar Logo
                                .resizable()
                                .scaledToFit()
                                .padding(.top, 80)
                                .padding(.horizontal, 10)
                            

                            VStack(alignment: .center, spacing: 25){
                            
                                VStack{
                                    emailView
                                    passwordView
                                    forgotPasswordButton
                                }
                                
                                buttonLogin
                                buttonLoginGoogle
                                Text("ou")
                                signUpButton
                                
                                
                            }// End VStack Components
                        } // End VStack Externa
                    } // End ScrollView
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 10)
                // End NavigationView - SignUp
            } // End Else
        } // End ZStack GoToHomeScreen
    }
}

// ------ Define Campo de Email
extension SignInView {
    var emailView: some View {
        EditTextView(placeholder: "Email",
                     text: $viewModel.email,
                     error: "Email Inválido",
                     failure: !viewModel.email.isEmail(), color: Color("dark"))
    }
}

// ------ Define Campo de Senha
extension SignInView{
    var passwordView: some View{
        EditTextView(placeholder: "Password",
                     text: $viewModel.password,
                     error: "Senha Inválida",
                     failure: viewModel.password.count < 8,
                     keyboard: .emailAddress, color: Color("dark"), isSecure: true)
    }
}

// ------ Define Button de Login
extension SignInView {
    var buttonLogin: some View {
        ButtonStyle(action: {
            //TODO: Adicionar Acao
        }, text: "Entrar",
                    disabled: !viewModel.email.isEmail() || viewModel.password.count < 8,
                    showProgress: self.viewModel.uiState == SignInUIState.loading, color: Color("baron"))
    }
}

// ------ Define Button de Login com Google
extension SignInView {
    // TODO: Desenvolver design para button do google
    var buttonLoginGoogle: some View {
        ButtonStyle(action: {
            viewModel.loginGoogleUser()
        }, text: "Entrar com Google", showProgress: self.viewModel.uiState == SignInUIState.loading, icon: "google_icon")
        .frame(maxWidth: 25, maxHeight: 25)
        .padding(.top, 20)
    }
}

// ---- Campo Esqueci Senha
extension SignInView {
    var forgotPasswordButton : some View {
        HStack{
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Redefinir Senha")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 14))
            })
        }
    }
}

// ---- Campo Esqueci Senha
extension SignInView {
    var signUpButton : some View {
        Button(action: {
            //TODO: Definir acao de recuperar senha
        }, label: {
            Text("Cadastre-se")
            .foregroundColor(Color.gray)
            .font(.system(size: 15))
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}
