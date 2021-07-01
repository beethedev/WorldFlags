//
//  ViewController.swift
//  WorldFlags
//
//  Created by Oluwabusayo Olorunnipa on 6/30/21.
//
// How to make this app better:
// Include all the world flags from the images directory
// Group countries by continents or regions

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    var names = ["af.png":"Afghanistan",
                    "aq.png":"Antarctica",
                    "ag.png":"Antigua and Barbuda",
                    "ae.png":"United Arab Emirates",
                    "ar.png":"Argentina",
                    "as.png":"American Samoa",
                    "ad.png":"Andorra",
                    "aw.png":"Aruba",
                    "at.png":"Austria",
                    "au.png":"Australia",
                    "ax.png":"Ãland Islands",
                    "ao.png":"Angola",
                    "al.png":"Albania",
                    "am.png":"Armenia",
                    "az.png":"Azerbaijan",
                    "ai.png":"Anguilla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "World Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
            
                
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
                
        // Select only countries whose code begin with a
        for item in items{
            if item.hasPrefix("a"){
                flags.append(item)
            }
            flags.sort()
        }
        // print(flags)
        //print(flags.count)
        
        
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
            
            vc.selectedImage = flags[indexPath.row]
            vc.countryName = names[flags[indexPath.row]] ?? "Unknown"
            
            navigationController?.pushViewController(vc, animated: true)
        }
    
    }
}

