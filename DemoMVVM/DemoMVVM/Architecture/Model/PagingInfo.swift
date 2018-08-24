//
//  PagingInfo.swift
//  TheMoviesReal
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import OrderedSet

struct PagingInfo<T: Hashable> {
    let page: Int
    let items: OrderedSet<T>
}

