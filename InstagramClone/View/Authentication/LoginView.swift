//
//  LoginView.swift
//  InstagramClone
//
//  Created by Nicholas Siciliano-Salazar  on 9/21/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    //Logo
                    Image("Instagram_wordmark")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .scaledToFill()
                        .frame(width: 150, height: 60)
                    
                    VStack(spacing: 20){
                        //email field
                        
                        CustomTextField(text: $email, placeholder: Text("Email..."), imageName: "envelope")
    //                        .padding()
    //                        .background(Color(.init(white: 1, alpha: 0.15)))
    //                        .cornerRadius(10)
    //                        .foregroundColor(.white)
    //                        .padding(.horizontal, 32)
                        
                        //password field
                        CustomSecureField(text: $password, placeholder: Text("Password..."))
    //                        .padding()
    //                        .background(Color(.init(white: 1, alpha: 0.15)))
    //                        .cornerRadius(10)
    //                        .foregroundColor(.white)
    //                        .padding(.horizontal, 32)
                        
                        
                        //forgot password
                        HStack{
                            Spacer()
                            
                            Button {
                                //todo
                               
                            } label: {
                                Text("Forgot Password")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    
                            }

                        }
                        .padding(.horizontal, 32)
                        
                        //sign in
                        
                        Button {
                            //todo
                            viewModel.login(withEmail: email, password: password)
                        } label: {
                            Text("Sign In ")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 50)
                                .background(Color(.purple.withAlphaComponent(0.6)))
                                .clipShape(Capsule())
                                .padding()
                        }
                        
                        Spacer()
                        
                        //Switch to sign up button
                        
                        NavigationLink{
                            RegistrationView().navigationBarHidden(true)
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
