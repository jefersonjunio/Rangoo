//
//  EditTextView.swift
//  Rangoo
//
//  Created by Gabi and Wallace on 13/06/23.
//

import SwiftUI

struct EditTextView: View {
    
    var placeholder: String = ""
    @Binding var text: String
    
    var error: String? = ""
    var failure: Bool? = nil
    var keyboard: UIKeyboardType = .default
    var color: Color = Color("vegan")
    var isSecure: Bool = false
    
    var body: some View {
        VStack{
            
            if isSecure{
                SecureField(placeholder, text: $text)
                    .foregroundColor(Color.black)
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle(color: color))
            } else {
                TextField(placeholder, text: $text)
                    .foregroundColor(Color.black)
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle(color: color))
            }
            
            if let error = error, failure == true, !text.isEmpty {
                Text(error).foregroundColor(.red)
            }
            
        }
    }
}

struct EditTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditTextView(placeholder: "Teste", text: .constant("Teste2"))
    }
}
