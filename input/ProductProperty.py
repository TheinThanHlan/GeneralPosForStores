{
    "unique_constraints": [['productPropertyName','value']],
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
            "name": "productPropertyName",
            "type": "ProductPropertyName",
            "default_value": '',
            "optional": False,
            "constraints": "not null",
            "dbAutoValue": False,
            "map": "ManyToOne",
        },
        {
            "name": "value",
            "type": "String",
            "default_value": '',
            "optional": False,
            "constraints": "not null",
            "dbAutoValue": False,
            "map": "",
        },

    ],
}
