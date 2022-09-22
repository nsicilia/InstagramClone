//
//  RegistrationView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 9/21/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                //Logo
                //Pick a photo button
                Button {
                    //todo
                    
                } label: {
                    VStack{
                        Image("GenericPhotoIcon")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        
                        Text("Upload an image!")
                            .foregroundColor(.white)
                            
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 32)
                    .padding(.horizontal)
                }
                .background(Color(.init(white: 1, alpha: 0.15)))
                .cornerRadius(10)
                .padding()
                
                VStack(spacing: 20){
                    //email field
                    CustomTextField(text: $email, placeholder: Text("Email..."), imageName: "envelope")
                    
                    //username field
                    CustomTextField(text: $username, placeholder: Text("Username..."), imageName: "person")
                    
                    //full name field
                    CustomTextField(text: $fullname, placeholder: Text("Full Name..."), imageName: "person")

                    //password field
                    CustomSecureField(text: $email, placeholder: Text("Password..."))
                    
                    //sign up
                    
                    Button {
                        //todo
                    } label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(.purple.withAlphaComponent(0.6)))
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    
                    //Switch to sign up button
                    
                    Button{
                        //go back
                        mode.wrappedValue.dismiss()
                        
                    } label: {
                        HStack{
                            Text("Don't have an account? ")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .bold))

                        }
                        .foregroundColor(.white)
                        .padding()
                    }

                }
                
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
