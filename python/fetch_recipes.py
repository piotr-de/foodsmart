import requests

data = requests.get("https://www.edamam.com/search?q=pizza&health=vegan&from=0&to=100").json()

return data
