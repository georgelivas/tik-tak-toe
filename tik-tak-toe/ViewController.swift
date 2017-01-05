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
    
    @IBOutlet weak var action: UIButton!
    @IBAction func action(_ sender: Any) {
        
        if (gameState[(sender as AnyObject).tag-1] == 0 && gameRunning == true
            ){
            
            gameState[(sender as AnyObject).tag-1] = activePlayer
            
            if (activePlayer == 1) {
                (sender as AnyObject).setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            } else {
                (sender as AnyObject).setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
                
            }
        }
        for combination in winnerIf {
            if gameState[combination[0]] != 0 &&
                gameState[combination[0]] ==
                gameState[combination[1]] &&
                gameState[combination[1]] ==
                gameState[combination[2]] {
                
                gameRunning = false
                if gameState[combination[0]] == 1 {
                    
                    label.text = "Cross has won!"
                } else {
                    label.text = "Nought has won!"
                }
                
                playAgainButton.isHidden = false;
                label.isHidden = false;
            }
        }
        
        gameRunning = false
        
        for i in gameState {
            if i == 0 {
                gameRunning = true
            }
        }
        if gameRunning == false {
            label.text = "It's a draw!"
            label.isHidden = false
            playAgainButton.isHidden = false;
        }

    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
        gameRunning = true
        activePlayer = 1
        playAgainButton.isHidden = true;
        label.isHidden = true;
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
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

