//
//  FirstViewController.swift
//  Coordinator
//
//  Created by Morgan Wilde on 7/17/16.
//  Copyright © 2016 Morgan Wilde. All rights reserved.
//

import UIKit

class FirstViewController: StatefulViewController {
  
  @IBAction func onSecondPress(sender: UIBarButtonItem) {
    performSegueWithIdentifier("showSecond", sender: nil)
  }
}