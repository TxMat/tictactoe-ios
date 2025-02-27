//
//  ViewController.swift
//  morpion
//
//  Created by Mathieu Ponal on 27/02/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var player: UInt8 = 1;
    var round_number: UInt8 = 0;
    
    var names: [String] = ["Player1", "Player2"]
    
//    var board: [UInt8] = [2,2,2,2,2,2,2,2,2]
    var board: [UInt8] = Array(repeating: 2, count: 9)

    // images
    let cross: UIImage = UIImage(named: "croix")!
    let circle: UIImage = UIImage(named: "rond")!
    let empty: UIImage = UIImage(named: "vide")!
    
    var image_array: [UIImage] = []
    
    let win_pattern_check : [[UInt8]] = [
        
        // horiz
        [0,1,2],
        [3,4,5],
        [6,7,8],
        
        // vert
        [0,3,6],
        [1,4,7],
        [2,5,8],
        
        // diag
        [0,4,8],
        [2,4,6],
    ]
    
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet var btn_array: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetMessage()
        image_array = [cross, circle, empty]
        printRoundGreet()
    }
    
    func printRoundGreet() {
        heading.text = "Au tour de \(names[Int(player)])"
        logo.image = image_array[Int(player)]
    }
    
    func resetMessage() {
        message.text = ""
    }
    
    

    @IBAction func btnTouch(_ sender: UIButton) {
        let btn_nb_touched = sender.tag
        print(btn_nb_touched)
        if board[btn_nb_touched] != 2 {
            message.text = "Click On Empty Squares"
            return;
        }
        resetMessage()
        board[btn_nb_touched] = player
        sender.setImage(image_array[Int(player)], for: .normal)
        round_number += 1;
        if HasWinner() == 2 {
            if board.count == round_number {
                printWinner(draw: true)
            } else {
                doNextRound()
            }
        } else {
            printWinner(draw: false)
        }
    }
    
    func printWinner(draw: Bool) {
        if draw {
            heading.text = "Nobody Wins :("
        } else {
            heading.text = "\(names[Int(player)]) Wins !"
        }
        for b in btn_array {
            b.isEnabled = false
        }
    }
    
    func HasWinner() -> UInt8 {
    outer: for pattern in win_pattern_check {
            for c in pattern {
                if board[Int(c)] != player {
                    continue outer
                }
            }
            return player
        }
        return 2
    }
    
    func doNextRound() {
        player = 1 - player
        printRoundGreet()
    }
    
}

