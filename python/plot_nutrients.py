import json
import matplotlib.pyplot as plt

with open("recipes/pizza_0_to_99.json") as f:
  data = json.load(f)
  # for recipe in data["hits"]:
  #   print(recipe["recipe"]["totalDaily"])
  fat = []
  sat_fat = []
  protein = []
  for hit in data["hits"]:
    fat.append(hit["recipe"]["totalDaily"]["FAT"]["quantity"])
    sat_fat.append(hit["recipe"]["totalDaily"]["FASAT"]["quantity"])
    protein.append(hit["recipe"]["totalDaily"]["PROCNT"]["quantity"])

fig, ax = plt.subplots()
ax.scatter(fat, sat_fat, s=protein)
fig.savefig('img.png')
