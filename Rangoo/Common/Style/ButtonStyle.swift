//
//  ButtonStyle.swift
//  Rangoo
//
//  Created by Wallace and Gabi on 13/06/23.
//

import SwiftUI

struct ButtonStyle: View {
    
    var action: () -> Void
    var text: String
    var disabled: Bool = false
    var showProgress: Bool = false
    
    var body: some View {
        ZStack {
            
            Button {
                action()
            }label:{
                Text(showProgress ? "": text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .foregroundColor(Color.white)
                    .background(Color.cyan)
                    .cornerRadius(4.0)
            }
            .disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
            
        }
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle(action:{}, text: "Clique Aqui")
    }
}
