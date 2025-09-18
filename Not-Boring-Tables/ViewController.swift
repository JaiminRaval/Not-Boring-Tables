//
//  ViewController.swift
//  Not-Boring-Tables
//
//  Created by Jaimin Raval on 04/09/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var superheroNames: [String] = [
        "Captain Thunder",
        "Shadow Blade",
        "Aqua Vortex",
        "Flame Phoenix",
        "Iron Sentinel",
        "Mystic Oracle",
        "Storm Rider",
        "Quantum Leap",
        "Neon Ghost",
        "Titan Forge",
        "Echo Mirage",
        "Frostbite",
        "Volt Surge",
        "Earth Shaker",
        "Lunar Eclipse",
        "Solar Flare",
        "Wind Whisper",
        "Cyber Hawk",
        "Venom Strike",
        "Crystal Guardian",
        "Blaze Runner",
        "Phantom Veil",
        "Gravity Master",
        "Radiant Star",
        "Thunderclap",
        "Ice Warden",
        "Shadow Weaver",
        "Plasma Bolt",
        "Rock Titan",
        "Aero Glide",
        "Bio Lumina",
        "Warp Speed",
        "Ember Knight",
        "Astral Voyager",
        "Pulse Wave",
        "Terra Form",
        "Nova Burst",
        "Specter Drift",
        "Bolt Fury",
        "Aqua Sentinel",
        "Flame Warden",
        "Steel Vortex",
        "Mystic Flame",
        "Storm Oracle",
        "Quantum Shadow",
        "Neon Phoenix",
        "Titan Surge",
        "Echo Frost",
        "Volt Phoenix",
        "Earth Mirage"
    ]

    var superPowers: [String] = [
        "Control lightning and thunder",
        "Manipulate shadows for stealth",
        "Command water and create whirlpools",
        "Generate and control fire",
        "Super strength and metal armor",
        "Predict future events",
        "Ride storms and control wind",
        "Teleport through dimensions",
        "Invisibility and energy bursts",
        "Forge weapons from any material",
        "Create illusions with sound",
        "Freeze objects and enemies",
        "Generate electricity",
        "Cause earthquakes",
        "Control moonlight for healing",
        "Harness solar energy",
        "Communicate with winds",
        "Hack technology with mind",
        "Poisonous strikes and agility",
        "Form crystal shields",
        "Run at supersonic speeds with fire",
        "Phase through objects",
        "Manipulate gravity fields",
        "Emit healing light",
        "Create sonic booms",
        "Form ice barriers",
        "Weave shadows into traps",
        "Shoot plasma projectiles",
        "Control rocks and earth",
        "Fly with aerodynamic precision",
        "Glow with bioluminescent energy",
        "Bend time for speed",
        "Wield flaming swords",
        "Travel through astral planes",
        "Emit electromagnetic pulses",
        "Reshape terrain",
        "Explode with stellar energy",
        "Drift as a ghostly entity",
        "Unleash furious lightning bolts",
        "Guard with water shields",
        "Wield eternal flames",
        "Create steel tornadoes",
        "Cast mystical fire spells",
        "Summon storm visions",
        "Shift quantum shadows",
        "Glow with neon rebirth",
        "Surge with titanic power",
        "Freeze echoes of sound",
        "Rise with electric flames",
        "Form illusory landscapes"
    ]


    @IBOutlet weak var MyDataTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyDataTable.dataSource = self
        MyDataTable.delegate = self
        MyDataTable.register(UINib(nibName: "MyDataCell", bundle: nil), forCellReuseIdentifier: "MyDataCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDataCell") as! MyDataCell
//        debug using print
//        print(indexPath.row)
        cell.NameTxt.text = "\(superheroNames[indexPath.row])"
        cell.powerTxt.text = "\(superPowers[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        step-1:
        let delAction = UIContextualAction(style: .destructive, title: "Delete") { action, v, completionHandler in
            self.superheroNames.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        
        delAction.backgroundColor = .red
        delAction.image = UIImage(systemName: "trash")
        
        let config = UISwipeActionsConfiguration(actions: [delAction])
        config.performsFirstActionWithFullSwipe = false
        
        return config

    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //  step-1: create action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            
            self.superheroNames.remove(at: indexPath.row)
            self.superPowers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            completion(true)
        }
        // step-2: configure attributes for action
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(systemName: "trash")
        // step-3: add action to config
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        // step-4: return configuration
        return config
    }

    
    
    
    
    @IBAction func addBtnPressed(_ sender: Any) {
        superheroNames.append("Thor")
        superPowers.append("Lightings")
        
        print(superheroNames.last!)
        print(superPowers.last!)
        MyDataTable.reloadData()
        
    }
    
}

