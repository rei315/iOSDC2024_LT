import UIKit

class TextKitProblemViewController: UIViewController {
    let tableView: UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextKit1Cell.self, forCellReuseIdentifier: "TextKit1Cell")
        tableView.register(TextKit2Cell.self, forCellReuseIdentifier: "TextKit2Cell")
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

extension TextKitProblemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result: UITableViewCell
        if indexPath.row <= 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextKit1Cell", for: indexPath) as! TextKit1Cell
            let shouldShowIcon = indexPath.row <= 4
            cell.configure(showIcon: shouldShowIcon)
            result = cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextKit2Cell", for: indexPath) as! TextKit2Cell
            let shouldShowIcon = indexPath.row <= 14
            cell.configure(showIcon: shouldShowIcon)
            result = cell
        }
        return result
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
