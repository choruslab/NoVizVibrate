//
//  InterfaceController.swift
//  NotifyWatchApp Extension
//
//  Created by Hamza Sohail on 23/01/21.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var notifyLabel: WKInterfaceLabel!
    private var session = WCSession.default
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        if isSuported() {
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    
    private func isSuported() -> Bool {
        return WCSession.isSupported()
    }
    
    private func isReachable() -> Bool {
        return session.isReachable
    }

}

extension InterfaceController: WCSessionDelegate {
    
    // 4: Required stub for delegating session
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void)
    {
        replyHandler(["messageReceived" : message])
        print(message)
        WKInterfaceDevice.current().play(.click)
        self.notifyLabel.setText(message["message"] as! String)
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.notifyLabel.setText("Listening for security notifications")
        }
    }
}
