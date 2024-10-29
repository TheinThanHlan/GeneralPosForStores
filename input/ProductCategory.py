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
            "name": "name",
            "type": "String",
            "default_value": "",
            "optional": False,
            "constraints": "not null unique",
            "dbAutoValue": False,
            "map": "",
        },
        {
            "name": "parentProductCategory",
            "type": "ProductCategory",
            "default_value": "",
            "optional": True,
            "constraints":"",
            "dbAutoValue":False,
            "map": "ManyToOne",
        },
    ],
}
