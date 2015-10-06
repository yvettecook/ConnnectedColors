//
//  ViewController.swift
//  ConnectedColours
//
//  Created by Yvette Cook on 06/10/2015.
//  Copyright © 2015 Yvette Cook. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController {
    
    @IBOutlet weak var connectionsLabel: UILabel!
    let colorService = ColorServiceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self
    }
    
    @IBAction func blueTapped(sender: UIButton) {
        self.changeColor(UIColor.blueColor())
        colorService.sendColor("blue")
    }
    
    @IBAction func redTapped(sender: UIButton) {
        self.changeColor(UIColor.redColor())
        colorService.sendColor("red")
    }

    func changeColor(color: UIColor){
        UIView.animateWithDuration(0.2) {
            self.view.backgroundColor = color
        }
    }

}

extension ViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }
    
    func colorChanged(manager: ColorServiceManager, colorString: String) {
        NSOperationQueue.mainQueue().addOperationWithBlock {
            switch colorString {
                case "red":
                    self.changeColor(UIColor.redColor())
                case "blue":
                    self.changeColor(UIColor.blueColor())
            default:
                print("unknown color value recieved: \(colorString)")
            }
        }
    }
    
}


