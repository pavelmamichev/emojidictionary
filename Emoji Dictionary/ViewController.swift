//
//  ViewController.swift
//  Emoji Dictionary
//
//  Created by Pavel Mamichev on 16/07/2017.
//  Copyright © 2017 Pavel Mamichev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dacooltableview: UITableView!
    
    
    var emojis : [Emoji] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dacooltableview.dataSource = self
        dacooltableview.delegate = self
        emojis = makeEmojiArray()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.stringEmoji
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier: "moveSegue", sender: emoji)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defVC = segue.destination as!
            DefinitionViewController
        defVC.emoji = sender as! Emoji
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeEmojiArray() -> [Emoji] {
        let emoji1 = Emoji()
        emoji1.stringEmoji = "🐱"
        emoji1.birthYear = 2310
        emoji1.category = "Animals"
        emoji1.definition = "An adorable kitten!"
        
        let emoji2 = Emoji()
        emoji2.stringEmoji = "🦊"
        emoji2.birthYear = 2110
        emoji2.category = "Animals"
        emoji2.definition = "A sneaky Fox!"
        
        return [emoji1, emoji2]
    
    }


}

