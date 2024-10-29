
import pandas as pd

df=pd.read_csv("./menuData.drinks.csv");
df=df.fillna(0);

#product template
productTemplates=[]
sepreator="--#-#"
for index,row in df.iterrows():
    productTemplates.append(f"({index+1},'{row['name']}')")

#product categories
categories=[]
for index,row in df.iterrows():
    for a,b in zip(df.keys()[1:4],[8,9,7]):
        if(row[a]==1):
            categories.append(f"({index+1},{b})")



#inventories and product properties
inventories=[]
productProperties=[]
count_id=486
product_id=86
for index,row in df.iterrows():
    product_id+=1
    for a,b in zip(df.keys()[4:],[16, 17, 18, 19, 20, 21, 22, 23, 24, 15 ]):
        if(row[a]==1):
           count_id+=1
           inventories.append(f"({count_id},{product_id})")
           productProperties.append(f"({count_id},{b})")


print(sepreator)
print("insert into 'ProductTemplate'(id,name) values")
print(",".join(productTemplates))
print(sepreator)
print(f"insert into '#_#_#ProductTemplate_ProductCategory'(productTemplateId,productCategoryId) values")
print(",".join(categories))
print(sepreator)
print(f"insert into 'Inventory'(id,productTemplate) values")
print(",".join(inventories))
print(sepreator)
print(f"insert into '#_#_#Inventory_ProductProperty'(inventoryId,productPropertyId) values")
print(",".join(productProperties))
