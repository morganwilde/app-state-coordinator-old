//
//  AppDelegate.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/14/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appStateCoordinator = AppStateCoordinator.shared

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    appStateCoordinator.states = [
      FirstAppState(),
      SecondAppState(),
      ThirdAppState(),
    ]
    
    return true
  }

}
