//
//  SecondViewController.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/17/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import UIKit

class SecondViewController: StatefulViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
      sleep(2)
      self.appState?.step()
    }
  }
  @IBAction func onThird(sender: UIBarButtonItem) {
    performSegueWithIdentifier("showThird", sender: nil)
  }
}