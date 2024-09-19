CREATE TABLE IF NOT EXISTS Order(
id INTEGER not null primary key      ,
customer INTEGER not null REFERENCES Customer(id)     ,
orderStatus INTEGER not null REFERENCES OrderStatus(id)     ,
totalPrice REAL not null  Default   0.0  ,
deliveryAddress INTEGER not null REFERENCES Address(id)     ,
orderDate Text not null  Default   CURRENT_TIMESTAMP  ,
items BLOB<Inventory> not null      
);
CREATE TABLE IF NOT EXISTS Employee(
id INTEGER not null primary key      ,
user INTEGER not null REFERENCES User(id)     ,
UNIQUE( user )
);
CREATE TABLE IF NOT EXISTS ProductTemplate(
id INTEGER not null primary key      ,
name Text not null unique  Default   ""  ,
SKU Text unique      ,
UPC Text unique      ,
description Text       ,
autoCustomer INTEGER  REFERENCES Customer(id)     
);
CREATE TABLE IF NOT EXISTS Color(
id INTEGER not null primary key      ,
name Text not null unique  Default   ""  ,
code Text not null unique  Default   ""  ,
autoInventory INTEGER  REFERENCES Inventory(id)     
);
CREATE TABLE IF NOT EXISTS Shop(
id INTEGER not null primary key      ,
createdDateTime Text not null  Default   CURRENT_TIMESTAMP  ,
name Text not null  Default   ""  ,
user INTEGER not null REFERENCES User(id)     ,
type INTEGER not null REFERENCES ShopType(id)     
);
CREATE TABLE IF NOT EXISTS ProductProvider(
id INTEGER not null primary key      ,
provider INTEGER not null REFERENCES User(id)     ,
ratings REAL       ,
UNIQUE( provider )
);
CREATE TABLE IF NOT EXISTS ProductSize(
id INTEGER not null primary key      ,
size Text not null  Default   ""  ,
autoInventory INTEGER  REFERENCES Inventory(id)     
);
CREATE TABLE IF NOT EXISTS ProductCategory(
id INTEGER not null primary key      ,
name Text not null unique  Default   ""  ,
categoryType INTEGER not null REFERENCES ProductCategoryType(id)     ,
autoProductSize INTEGER  REFERENCES ProductSize(id)     
);
CREATE TABLE IF NOT EXISTS PhoneNumber(
id INTEGER not null primary key      ,
number Text not null uniqe  Default   ""  ,
autoUser INTEGER  REFERENCES User(id)     
);
CREATE TABLE IF NOT EXISTS Salary(
id INTEGER not null primary key      ,
salary INTEGER not null  Default   0  ,
dateTime Text not null  Default   CURRENT_TIMESTAMP  ,
employee INTEGER not null REFERENCES Employee(id)     
);
CREATE TABLE IF NOT EXISTS Address(
id INTEGER not null primary key      ,
address Text not null  Default   ""  ,
latitude REAL       ,
longitude REAL       ,
autoUser INTEGER  REFERENCES User(id)     
);
CREATE TABLE IF NOT EXISTS ProductCategoryType(
id INTEGER not null primary key      ,
name Text not null unique  Default   ""  
);
CREATE TABLE IF NOT EXISTS Template(
id INTEGER not null primary key      ,
createdDateTime Text not null  Default   CURRENT_TIMESTAMP  
);
CREATE TABLE IF NOT EXISTS Inventory(
id INTEGER not null primary key      ,
productTemplate INTEGER not null REFERENCES ProductTemplate(id)     ,
qty INTEGER not null  Default   0  ,
currentPrice INTEGER not null REFERENCES ProductPrice(id)     ,
UNIQUE( currentPrice )
);
CREATE TABLE IF NOT EXISTS DeliveryMethod(
id INTEGER not null primary key      ,
name REAL not null unique  Default   0.0  
);
CREATE TABLE IF NOT EXISTS ProductPrice(
id INTEGER not null primary key      ,
price INTEGER not null unique  Default   0  ,
autoInventory INTEGER  REFERENCES Inventory(id)     
);
CREATE TABLE IF NOT EXISTS User(
id INTEGER not null primary key      ,
name Text not null  Default   ""  ,
socialSecurityNumber Text unique      ,
driverLicense Text unique      ,
email Text not null unique  Default   ""  
);
CREATE TABLE IF NOT EXISTS Delivery(
id INTEGER not null primary key      ,
rating REAL       ,
deliveryMethod INTEGER not null REFERENCES DeliveryMethod(id)     
);
CREATE TABLE IF NOT EXISTS OrderStatus(
id INTEGER not null primary key      ,
name Text not null unique  Default   ""  
);
CREATE TABLE IF NOT EXISTS ShopType(
id INTEGER not null primary key      ,
type Text not null unique  Default   ""  
);
CREATE TABLE IF NOT EXISTS Customer(
id INTEGER not null primary key      ,
user INTEGER not null unique REFERENCES User(id)     ,
UNIQUE( user )
);