//
//  ThirdAppState.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/17/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import Foundation
import UIKit

class ThirdAppState: AppState {
  init() {
    super.init()
    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    viewController = mainStoryboard.instantiateViewControllerWithIdentifier("ThirdViewController") as? ThirdViewController
  }
}