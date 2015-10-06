//
//  ColorServiceManagerDelegate.swift
//  ConnectedColours
//
//  Created by Yvette Cook on 06/10/2015.
//  Copyright © 2015 Yvette Cook. All rights reserved.
//

import Foundation

protocol ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager : ColorServiceManager, connectedDevices: [String])
    func colorChanged(manager : ColorServiceManager, colorString: String)
    
}