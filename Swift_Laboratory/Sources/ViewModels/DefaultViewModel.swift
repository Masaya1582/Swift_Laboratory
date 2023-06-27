// 
//  DefaultViewModel.swift
//  Swift_Laboratory
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

// import RxSwift
// import RxCocoa

protocol DefaultViewModelInputs: AnyObject {

}

protocol DefaultViewModelOutputs: AnyObject {

}

protocol DefaultViewModelType: AnyObject {
    var inputs: DefaultViewModelInputs { get }
    var outputs: DefaultViewModelOutputs { get }
}

class DefaultViewModel: DefaultViewModelType, DefaultViewModelInputs, DefaultViewModelOutputs {

    var inputs: DefaultViewModelInputs { return self }
    var outputs: DefaultViewModelOutputs { return self }

    // private let disposeBag = DisposeBag()

    init() {
        
    }

}
