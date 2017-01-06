//
//  ViewController.swift
//  tik-tak-toe
//
//  Created by Giorgos livas on 05/01/2017.
//  Copyright © 2017 Giorgos livas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// 1 == cross / 2 == nought
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
    
<<<<<<< HEAD
    let winnerIf = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
    var gameRunning = true
    
    
    @IBOutlet weak var label: UILabel!
    
   
=======
>>>>>>> parent of bc4581b... running!
    @IBAction func action(_ sender: Any) {
        
        if (gameState[(sender as AnyObject).tag-1] == 0){
            if (activePlayer == 1) {
                (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            } else {
                (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

