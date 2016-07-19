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
  
  // If state tracking is done with actual step names
  private var steps = [String]()
  private var finalSteps: [String]?
  // If state tracking is done with a step counter
  private var stepNumber = 0
  private var finalStepNumber: Int?
  
  var viewController: StatefulViewController?
  
  init(finalStepNumber: Int = 1) {
    self.finalStepNumber = finalStepNumber
  }
  init(finalSteps: [String]) {
    self.finalSteps = finalSteps
  }
  init(finalStep: String) {
    finalSteps = [finalStep]
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
  func step(name: String? = nil) {
    dispatch_async(dispatch_get_main_queue()) {
      AppStateCoordinator.shared.active = true
      
      // Increment step
      if let name = name {
        self.steps.append(name)
      }
      self.stepNumber += 1
      
      // Check for final conditions
      if let finalSteps = self.finalSteps {
        var proceed = true
        for finalStep in finalSteps {
          if !self.steps.contains({$0 == finalStep}) {
            proceed = false
          }
        }
        if proceed {
          self.transitionOut()
        }
      }
      if let finalStepNumber = self.finalStepNumber {
        if self.steps.count == finalStepNumber {
          self.transitionOut()
        }
      }
      
      // Notify of step changes
      self.didStep(name)
    }
  }
  func didStep(stepName: String?) {}
}
