//
//  Storable.swift
//  Football
//
//  Created by Alexander Filimonov on 04/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import CoreData

public protocol Storable {}

extension NSManagedObject: Storable {}
