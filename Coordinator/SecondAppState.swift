//
//  SecondAppState.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/17/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import UIKit

class SecondAppState: AppState {
  init() {
    super.init(finalStep: "Slept for 2 seconds.")
    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    viewController = mainStoryboard.instantiateViewControllerWithIdentifier("SecondViewController") as? SecondViewController
  }
  override func didStep(stepName: String?) {
    print(stepName)
  }
}
