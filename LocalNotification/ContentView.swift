//
//  ContentView.swift
//  LocalNotification
//
//  Created by sergio shaon on 6/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button{
                UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge,.alert]) { success, error in
                    if success {
                        print("Notification Successful")
                    }
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Request Permission")
                    .padding()
                    .background(.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }
            
            Button{
                let content = UNMutableNotificationContent()
                content.title = "Bring me food"
                content.subtitle = "Hourly reminder to eat something"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            } label:{
                Text("Schedule Notification")
                    .padding()
                    .background(.orange)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
