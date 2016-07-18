//
//  AppStateCoordinator.swift
//  Shoplandia
//
//  Created by Morgan Wilde on 7/14/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import Foundation
import UIKit

class AppStateCoordinator: NSObject {
  
  static let shared = AppStateCoordinator()
  static let navigationViewController = (UIApplication.sharedApplication().delegate as? AppDelegate)?.window?.rootViewController as? UINavigationController
  
  var active = false
  var states = [AppState]() {
    didSet {
      currentStateIndex = 0
    }
  }
  var currentStateIndex = -1
  
  override init() {
    super.init()
    let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
    let navigationController = appDelegate?.window?.rootViewController as? UINavigationController
    navigationController?.delegate = self
  }
  
  func go() {
    currentStateIndex += 1
    if states.count > 0 && currentStateIndex >= 0 && currentStateIndex < states.count {
      states[currentStateIndex].transitionIn()
    }
  }
}

extension AppStateCoordinator: UINavigationControllerDelegate {
  
  func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
    if navigationController.topViewController == navigationController.viewControllers.first && active {
      go()
    }
  }
}