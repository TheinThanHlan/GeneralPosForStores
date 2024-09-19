
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
            "name": "salary",
            "type": "int",
            "default_value": 0,
            "optional": False,
            "constraints": "not null",
            "dbAutoValue": False,
            "map": "",
        },
        {
            "name": "dateTime",
            "type": "DateTime",
            "default_value": "",
            "optional": True,
            "constraints": "not null",
            "dbAutoValue": True,
            "map": "",
        },
        {
            "name": "employee",
            "type": "Employee",
            "default_value": "",
            "optional": False,
            "constraints": "not null",
            "dbAutoValue": False,
            "map": "ManyToOne",
        },
    ],
}
