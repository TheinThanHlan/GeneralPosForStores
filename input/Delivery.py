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
            "name": "rating",
            "type": "double",
            "default_value": 0.0,
            "optional": True,
            "constraints": "",
            "dbAutoValue": False,
            "map": "",
        },
        {
            "name": "deliveryMethod",
            "type": "DeliveryMethod",
            "default_value": "",
            "optional": False,
            "constraints": "not null",
            "dbAutoValue": False,
            "map": "ManyToOne",
        },
    ],
}
