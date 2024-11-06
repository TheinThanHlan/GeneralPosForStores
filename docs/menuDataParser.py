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
    for bI,b in zip(range(1,13),row[2:14]):
        if b==1:
            for a in [13,14,15]:
                count_id+=1
                inventories.append(f"({count_id},{row['id']})")
                productProperties.append(f"({count_id},{a})")
                productProperties.append(f"({count_id},{bI})")



def split_join_print(insert_stmt,arr):
    output=""
    sepreator="--#-#"
    count=0
    tmp_arr=[]
    for a in arr:
        if count>400:
            output+=insert_stmt+"\n"
            output+=",".join(tmp_arr)+"\n"
            output+=sepreator+"\n"

            count=0
            tmp_arr=[]

        tmp_arr.append(a);
        count+=1
    output+=insert_stmt+"\n"
    output+=",".join(tmp_arr)+"\n"
    output+=sepreator+"\n"
    return output




with open("tmp","a") as f:
    f.write(split_join_print("insert into 'ProductTemplate'(id,name) values",productTemplates))
    f.write(split_join_print(f"insert into '#_#_#ProductTemplate_ProductCategory'(productTemplateId,productCategoryId) values",categories))
    f.write(split_join_print(f"insert into 'Inventory'(id,productTemplate) values",inventories))
    f.write(split_join_print(f"insert into '#_#_#Inventory_ProductProperty'(inventoryId,productPropertyId) values",productProperties))
