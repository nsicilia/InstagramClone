//
//  SearchBar.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 8/25/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
        
    var body: some View {
        HStack{
            
            //The search bar
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                    }
                )
                .onTapGesture {
                    isEditing = true
                    
                }
            
            //Add the cancel button of true
            if isEditing {
                Button {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEdit()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color.black)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                //Dosent work...
                //.animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Text"), isEditing: .constant(true))
    }
}
