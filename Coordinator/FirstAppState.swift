//
//  FirstAppState.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/17/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import Foundation

class FirstAppState: AppState {
  init() {
    super.init(finalStepNumber: 1)
    viewController = AppStateCoordinator.navigationViewController?.viewControllers.first as? FirstViewController
    viewController?.appState = self
  }
  override func transitionIn() {}
}
