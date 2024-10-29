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
            "name": "createdDateTime",
            "type": "DateTime",
            "default_value": "",
            "optional":True,                #is optional in dart constructor
            "constraints":"not null",
            "dbAutoValue":True,                 #use the db default value
            "map":"",                       # OneToOne , ManyToOne , ManyToMany
        },
        {
            "name": "price",
            "type": "int",
            "default_value": "",
            "optional":False,
            "constraints": "not null",
            "dbAutoValue":False,
            "map": "",
        },
    ],
}
