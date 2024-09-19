{
    "unique_constraints": [],
    "variables": [
        {
            "name": "id",
            "type": "long",
            "default_value": 0,
            "optional": True,
            "constraints": "not null primary key",
            "dbAutoValue": True,
            "map": "",
        },
        {
            "name": "size",
            "type": "String",
            "default_value": "",
            "optional": False,
            "constraints": "not null",
            "dbAutoValue": False,
            "map": "",
        },
        {
            "name": "productCategories",
            "type": "List<ProductCategory>",
            "default_value":"",
            "optional": True,
            "constraints": "",
            "dbAutoValue": False,
            "map": "OneToMany",
        
        }
    ],
}
