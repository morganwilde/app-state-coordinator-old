//
//  AppState.swift
//  Shoplandia
//
//  Created by Morgan Wilde on 7/14/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import Foundation
import UIKit

class AppState {
  
  var currentStep = 0 {
    willSet {
      if newValue == 1 {
        AppStateCoordinator.shared.active = true
      }
    }
    didSet {
      if currentStep == finalStep {
        transitionOut()
      }
    }
  }
  var finalStep = 1
  var viewController: StatefulViewController?
  
  init(finalStep: Int = 1) {
    self.finalStep = finalStep
  }
  
  func transitionIn() {
    if let viewController = viewController {
      viewController.appState = self
      AppStateCoordinator.navigationViewController?.pushViewController(viewController, animated: true)
    }
  }
  func transitionOut() {
    AppStateCoordinator.shared.go()
  }
  func step() {
    dispatch_async(dispatch_get_main_queue()) {
      self.currentStep += 1
    }
  }
}
