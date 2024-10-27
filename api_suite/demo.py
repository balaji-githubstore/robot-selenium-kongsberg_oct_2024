import requests

response=requests.get()

print(response.status_code)
print(response.text)
print(response.json())