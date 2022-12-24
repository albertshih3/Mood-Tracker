//
//  HYU_CatSettings.swift
//  Mood Tracker
//
//  Created by Kaelin Shih on 12/23/22.
//  Cat = Catagory
//

import SwiftUI
import UIKit
import SwiftKeychainWrapper

struct SHeaderOverlay: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .shadow(color: Color.black, radius: 1, x: 0, y: 0)
            Text("Customize your experience!")
                .font(.system(.callout, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 2.0)
                .shadow(color: Color.black, radius: 1, x: 0, y: 0)
        }
            .padding(20)
    }
}

struct HYU_CatSettings: View {
    
    // Variables here
    @AppStorage("firstName") private var firstName = ""
    @AppStorage("lastName") private var lastName = ""
    @AppStorage("darkModeNoSystem") private var darkModeNoSystem = false
    
    @State var refresh: Bool = false
    
    var body: some View {
        
        // Header information below
        // End header here
        // Begin settings navigation
        
        NavigationView {
            Form {
                Section(header: Text("Personal Information"), footer: Text("Your name will be used to make the app more personalized to you. It is stored locally.")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                Section(header: Text("App Customization")) {
                    Toggle("Turn on Dark Mode", isOn: $darkModeNoSystem)
                }
            }
            .navigationTitle("Settings")
            .onTapGesture {
                hideKeyboard()
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button ("Save") {
                        refresh.toggle()
                    }
                }
            }
        }
    }
}

struct HYU_CatSettings_Previews: PreviewProvider {
    static var previews: some View {
        HYU_CatSettings()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
