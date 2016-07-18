//
//  StatefulViewController.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/17/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import UIKit

class StatefulViewController: UIViewController {

  var appState: AppState?
  
  override func viewDidAppear(animated: Bool) {
    appState?.step()
    super.viewDidAppear(animated)
  }
}
