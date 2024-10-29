import pandas as pd

df=pd.read_csv("./menuData.csv");
df=df.fillna(0);

#product template
productTemplates=[]
sepreator="--#-#"
for index,row in df.iterrows():
    productTemplates.append(f"({row['id']},'{row['name']}')")

#product categories
categories=[]
for index,row in df.iterrows():
    for a in range(0,len(row.keys()[14:])):
        if(row[row.keys()[14:][a]]==1):
            categories.append(f"({row['id']},{a+1})")



#inventories and product properties
inventories=[]
productProperties=[]
count_id=0
for index,row in df.iterrows():
    for b in range(0,len(row.keys()[2:14])):
        if(row[row.keys()[2:14][b]]==1):
            for a in [13,14,15]:
                count_id+=1
                inventories.append(f"({count_id},{row['id']})")
                productProperties.append(f"({count_id},{a})")
                productProperties.append(f"({count_id},{b+1})")


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
