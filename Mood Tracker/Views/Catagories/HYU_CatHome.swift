//
//  HYU_CatHome.swift
//  Mood Tracker
//
//  Created by Kaelin Shih on 12/23/22.
//  Cat = Catagory
//
//  What is this file?
//  The goal is for this file to be the main UI of the How Are You (TBD) App. This screen should appear after the launch screen during every launch EXCEPT first launch of app.

import SwiftUI
import UIKit

let defaults = UserDefaults.standard
let firstName = defaults.string(forKey: "firstName")


// HeaderOverlay. Contains the text that will be overlayed over the header image.
struct HeaderOverlay: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome back!")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .foregroundColor(.white)
            Text("How are you feeling today?")
                .font(.system(.callout, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 5.0)
        }
            .padding(20)
    }
}

// UsrDta. User data struct. Data will most likely be stored in seperate data file but for now placeholders can go here. Used below to put user information in prominant locations.
struct UsrDta: View {
    
    let firstName = defaults.string(forKey: "firstName")
    
    var body: some View {
        
        VStack(alignment: .leading) {
            // Text("User Name")
            Text(firstName ?? "<no name entered>")
                .font(.system(.body, design: .rounded))
                .bold()
                .foregroundColor(.black)
            Text("Joined 1/1/22")
                .font(.system(.body, design: .rounded))
                .foregroundColor(.black)
        }
            .padding(6)
    }
}

// Button Style
struct BlueButton: ButtonStyle {
    
    @State private var isPressed = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .opacity(isPressed ? 0.6 : 1.0)
            .scaleEffect(isPressed ? 0.9 : 1.0)
            .pressEvents {
                // On press
                withAnimation(.easeInOut(duration: 0.2)) {
                    isPressed = true
                }
            } onRelease: {
                withAnimation {
                    isPressed = false
                }
            }
    }
}

// Catagory home. Home page of the app. Users should be shown this when they first open the app. The below struct is the main home page.
struct HYU_CatHome: View {
    
    var body: some View {
        
        // ScrollView section is for the header image. This allows the image to be stretched so the user is able to scroll up and down.
        ScrollView {
            GeometryReader { geometry in
                ZStack {
                    if geometry.frame(in: .global).minY <= 0 {
                        Image("MainViewHeader")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .overlay(HeaderOverlay(), alignment: .bottomLeading)
                        .offset(y: geometry.frame(in: .global).minY/9)
                        .clipped()
                    } else {
                        Image("MainViewHeader")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .overlay(HeaderOverlay(), alignment: .bottomLeading)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
                .frame(height: 400)
            
            
            // New Vertical & Horizontal stack. Going to add a button where the user can click to update their mood. Can also use this section to display user information.
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    // User image
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipped()
                        .cornerRadius(10)
                    UsrDta()
                    
                    // Mood tracker button thing
                    Button("Update Your Mood") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                        .buttonStyle(BlueButton())
                }
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(10)
            .clipped()
            .shadow(color: Color.black, radius: 1, x: 0, y: 0)
        }
            .edgesIgnoringSafeArea(.top)
    }
}

    
struct HYU_Main_Previews: PreviewProvider {
    static var previews: some View {
        HYU_CatHome()
    }
}
