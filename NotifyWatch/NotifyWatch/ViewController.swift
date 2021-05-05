//
//  ViewController.swift
//  NotifyWatch
//
//  Created by Hamza Sohail on 23/01/21.
//

import UIKit
import WatchConnectivity

let VIBRATE_WATCH = "vibrate watch"

class ViewController: UIViewController {
    
    private var session = WCSession.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.notifyWatch), name: NSNotification.Name.init(VIBRATE_WATCH), object: nil)
        
        if isSuported() {
            session.delegate = self
            session.activate()
        }
        
    }

    @objc func notifyWatch() {
        if isReachable() {
            session.sendMessage(["message" : "Recieved a security alert"], replyHandler: { (response) in
                print(response)
            }, errorHandler: { (error) in
                print("Error sending message: %@", error)
            })
        } else {
            print("Watch is not reachable!")
        }
    }
    
    
    private func isSuported() -> Bool {
        return WCSession.isSupported()
    }
    
    private func isReachable() -> Bool {
        return session.isReachable
    }
}


extension ViewController: WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
    
    
    // 4: Required stub for delegating session
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidCompleteWith activationState:\(activationState) error:\(String(describing: error))")
    }
    
}
