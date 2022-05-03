//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    private var client: ChatClient?
    private var messages: [Message] = []
  
    // MARK: - IBOutlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        fetchData()
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ChatTableViewCell? = nil
        if cell == nil {
            let nibs = Bundle.main.loadNibNamed("ChatTableViewCell", owner: self, options: nil)
            cell = nibs?[0] as? ChatTableViewCell
        }
        
        guard let cell = cell else { return UITableViewCell() }

        cell.fillCell(message: messages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    // MARK: - Helper Methods
    func configureTable(tableView: UITableView) {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func updateViews() {
        title = "Chat"
        messages = [Message]()
        configureTable(tableView: chatTable)
    }
    
    func fetchData() {
        ChatClient.fetchChatData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let messages):
                    self.messages = messages
                    self.chatTable.reloadData()
                case .failure(let error):
                    print(error)
                    print(error.localizedDescription)
                }
            }
        }
    }
}


