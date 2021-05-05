//
//  SocketIOManager.swift
//  NotifyWatch
//
//  Created by Hamza Sohail on 23/01/21.
//

import Foundation
import SocketIO

//let SOCKET_URL = "http://backend.hsohail.com:3030"
let SOCKET_URL = "http://15.223.63.196:3030"

class SocketIOManager: NSObject {
    
    static let sharedInstance = SocketIOManager()
    
    var socket: SocketIOClient!

    let manager = SocketManager(socketURL: URL(string: SOCKET_URL)!, config: [.log(true), .forcePolling(true)])

    override init() {
        super.init()
        
        socket = manager.defaultSocket
        
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
        }
        
        socket.on("notify") { dataArray, ack in
            NotificationCenter.default.post(name: NSNotification.Name.init(VIBRATE_WATCH), object: nil)
        }

    }

    func establishConnection() {
        socket.connect()
    }

    func closeConnection() {
        socket.disconnect()
    }
}
