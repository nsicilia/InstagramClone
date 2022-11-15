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
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                //Logo
                if let image = image{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .clipShape(Circle())
                        .padding()
                    
                }else{
                    //Pick a photo button
                    Button {
                        imagePickerPresented.toggle()
                        
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
                    //The image selection pop-up, runs the loadImage function when the sheet is dismissed
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                        //Selects an image from the UIKit image picker, sets that photo to selectedImage var
                        ImagePicker(image: $selectedImage)
                    })
                    .padding()
                }
                
                VStack(spacing: 20){
                    //email field
                    CustomTextField(text: $email, placeholder: Text("Email..."), imageName: "envelope")
                    
                    //username field
                    CustomTextField(text: $username, placeholder: Text("Username..."), imageName: "person")
                    
                    //full name field
                    CustomTextField(text: $fullname, placeholder: Text("Full Name..."), imageName: "person")

                    //password field
                    CustomSecureField(text: $password, placeholder: Text("Password..."))
                    
                    //sign up
                    
                    Button {
                        //todo
                        viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username.lowercased())
                        
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


extension RegistrationView{
    func loadImage(){
        //if the selectedImage is set we set it to the postImage(the UIKit to swiftui image conversion)
        guard let selectedImage = selectedImage else {return }
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
