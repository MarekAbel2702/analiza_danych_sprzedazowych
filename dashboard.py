import pandas as pd
import pyodbc

conn = pyodbc.connect(
    'DRIVER={SQL SERVER}; SERVER=LAPTOP-M79Q5NVL\\SQLEXPRESS; Database=Sprzedaż; Trusted_Connection=yes;'
)

orders = pd.read_sql("""
    SELECT o.order_date, o.quantity, o.price_per_unit, o.discount_percent,
            p.category, c.gender, s.region
        FROM orders o
        JOIN products p ON o.product_id = p.product_id
        JOIN customers c ON o.customer_id = c.customer_id
        JOIN stores s ON o.store_id = s.store_id
""", conn)

orders['revenue'] = orders['quantity'] * orders['price_per_unit'] * (1 - orders['discount_percent'] / 100)

import numpy as np

print("Średni przychód:", np.mean(orders['revenue']))
print("Mediana:", np.median(orders['revenue']))
print("Odchylenie standardowe:",np.std(orders['revenue']))

orders['order_date'] = pd.to_datetime(orders['order_date'])
orders['month'] = orders['order_date'].dt.to_period('M')

monthly = orders.groupby('month')['revenue'].sum()

import matplotlib.pyplot as plt

plt.figure(figsize=(12, 6))
monthly.plot(kind='bar',color='skyblue')
plt.title("Miesięczny przychód")
plt.ylabel("Przychód [zł]")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

top_categories = orders.groupby('category')['revenue'].sum().sort_values(ascending=False)

plt.figure(figsize=(8, 5))
top_categories.plot(kind='barh')
plt.title("Przychód wg kategorii produktów")
plt.xlabel("Przychód")
plt.tight_layout()
plt.show()

gender_sales = orders.groupby('gender')['revenue'].sum()

plt.pie(gender_sales, labels=gender_sales.index, autopct='%1.1f%%', startangle=90)
plt.title("Udział płci w przychodach")
plt.axis('equal')
plt.show()

import seaborn as sns

plt.figure(figsize=(6, 5))
sns.heatmap(orders[['price_per_unit', 'discount_percent', 'revenue']].corr(), annot=True, cmap='coolwarm')
plt.title("Korelacje między ceną, rabatem a przychodem")
plt.show()