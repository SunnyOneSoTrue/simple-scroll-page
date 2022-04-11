//
//  ScrollPageViewController.swift
//  simple scroll page
//
//  Created by USER on 11.04.22.
//

import UIKit


class ScrollPageViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        TableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        
        posts = [
            Post(user: User(name: "Michael", username: "@Michael", image: UIImage(systemName: "pencil")!),
                 text: "I can't believe this!",
                 image: UIImage(systemName: "person")!),
            
            Post(user: User(name: "John", username: "@John", image: UIImage(systemName: "lasso")!),
                 text: "The FitnessGram™ Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly, but gets faster each minute after you hear this signal. [beep] A single lap should be completed each time you hear this sound. [ding] Remember to run in a straight line, and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark, get ready, start.",
                 image: UIImage(systemName: "sun.min")!),
            
            Post(user: User(name: "Sandro", username: "@SunnySideUp", image: UIImage(systemName: "car")!),
                 text: "couldn't think what to write here",
                 image: UIImage(systemName: "globe")!)
        ]
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddNewPostViewController") as! AddNewPostViewController
        vc.user = posts[2].user
        vc.ScrollPageViewControllerDelegate = self
        present(vc, animated: true)
    }
    
    
}


//MARK: Tableview setup
extension ScrollPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.profileImageView.image = posts[indexPath.row].user.image
        cell.nameLabel.text = posts[indexPath.row].user.name
        cell.usernameLabel.text = posts[indexPath.row].user.username
        cell.postTextView.text = posts[indexPath.row].text
        cell.postImageView.image = posts[indexPath.row].image
        
        return cell
    }
}

//MARK: Delegate stuff
extension ScrollPageViewController: ScrollPageViewControllerDelegate {
    func didAddPost(_ post: Post) {
        posts = posts.reversed()
        posts.append(post)
        posts = posts.reversed()
        TableView.reloadData()
    }
}
