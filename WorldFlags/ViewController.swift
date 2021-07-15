//
//  ViewController.swift
//  WorldFlags
//
//  Created by Oluwabusayo Olorunnipa on 6/30/21.
//
// How to make this app better:
// Include filter key on right to quickly jump to country without scrolling
// Add game component for guessing country before switching to detail controller
// Group countries by continents or regions

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    var names = CountryNames
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "World Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
            
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        // Select all country flags in directory using extension .png
        for item in items{
            if item.hasSuffix(".png"){
                flags.append(item)
            }
            flags.sort()
        }
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return flags.count
       }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row].prefix(2).uppercased()
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            let fileName = flags[indexPath.row]
            let index = fileName.index(fileName.startIndex, offsetBy: 2)
            vc.selectedImage = fileName
            vc.countryName = names[String(fileName.prefix(upTo: index))] ?? "Unknown"
            
            navigationController?.pushViewController(vc, animated: true)
        }
    
    }
}

