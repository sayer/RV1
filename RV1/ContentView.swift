//
//  ContentView.swift
//  RV1
//
//  Created by Stephen Ayers on 7/31/19.
//  Copyright © 2019 Stephen Ayers. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var stream: SLStream =  SLStream()
    @State var tt0 = dg(event: TANK_STATUS, instance: 0).tankSize
    @State var tt1 = dg(event: TANK_STATUS, instance: 1).tankSize
    
    @State var tl0 = dg(event: TANK_STATUS, instance: 0).tankLevel
    @State var tl1 = dg(event: TANK_STATUS, instance: 1).tankLevel
    @State var tl0Percent = dg(event: TANK_STATUS, instance: 0).tankLevelPercent
    @State var tl1Percent = dg(event: TANK_STATUS, instance: 1).tankLevelPercent
    @State var doorLocked = dg(event: LOCK_STATUS, instance: 1).doorLocked
    @State var refreshCount = 0
    
    
    var body: some View {
        VStack {
            Text("Foretravel Stats").bold()
            Text("Fresh Tank: \(tl0) of \(tt0) \(tl0Percent)%")
            Text("Waste Tank: \(tl1) of \(tt1) \(tl1Percent)%")
            Text("Entry Door locked: \(doorLocked ? "Yes" : "No")")
            Text("Error: \(ConnectError != nil ? ConnectError.localizedDescription : ":-)")")
            Text("")
            Button(action: {self.stream.readLive()
                self.refreshCount += 1
            }) {
                Text("Refresh  \(refreshCount)")
            }
            Button(action: {self.stream.reconnect()
                self.refreshCount += 1
            }) {
                Text("Reconnect")
            }
            Text("Processed: \(stream.messagesProcessed)")
            Text("Message: \(tempMessage ?? "")")
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
