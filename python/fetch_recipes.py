import requests
import json

query = "pizza"

n = 0
m = 99

url = f"https://www.edamam.com/search?q=pizza&health=vegan&from={n}&to={m}"

data = requests.get(url)

results = data.json()
count = results["count"]

with open(f'recipes/{query}_{n}_to_{m}.json', "w", encoding="utf-8") as f:
  json.dump(results, f, ensure_ascii=False, indent=4)

if count > 99:
  n = n + 100
  m = m + 100
  while n <= count:
    extra_data = requests.get(f"https://www.edamam.com/search?q=pizza&health=vegan&from={n}&to={m}").json()
    with open(f'recipes/{query}_{n}_to_{m}.json', "w", encoding="utf-8") as f:
      json.dump(extra_data, f, ensure_ascii=False, indent=4)
    n = n + 100
    m = m + 100
