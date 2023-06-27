//
//  HomeViewController.swift
//  Swift_Laboratory
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private let sampleArray: [String] = ["りんご", "ゴリラ", "ラッパ", "パンダ", "ダチョウ", "うさぎ", "ギアチェンジ", "ジャンク", "くるま", "マンゴー", "ごんぎつね", "ネオン"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DefaultTableViewCell", bundle: nil), forCellReuseIdentifier: "DefaultTableViewCell")
    }

    // ContextMenuに表示するもの
    private func createContextMenu() -> UIMenu {
        let copy = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc")) { action in
            print("DEBUG_PRINT: Copy Selected")
        }

        let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
            print("DEBUG_PRINT: Share Selected")
        }

        let play = UIAction(title: "Play", image: UIImage(systemName: "play.circle")) { action in
            print("DEBUG_PRINT: Play Selected")
        }

        let delete = UIAction(title: "Delete", image: UIImage(systemName: "delete.left")) { action in
            print("DEBUG_PRINT: Delete Selected")
        }
        return UIMenu(title: "Select", children: [copy, share, play, delete])
    }

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultTableViewCell", for: indexPath) as? DefaultTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(sampleArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { suggestedActions in
            return self.createContextMenu()
        })
    }

}
