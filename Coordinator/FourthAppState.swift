//
//  FourthAppState.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/17/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import Foundation
import UIKit

class FourthAppState: AppState {
  init() {
    super.init()
    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    viewController = mainStoryboard.instantiateViewControllerWithIdentifier("FirstViewController") as? FirstViewController
  }
}