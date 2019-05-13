import json

with open('data/data.json') as f:
    data = json.load(f)

del data['angle']
data['angles'] = 40

with open('data/data.json', 'w') as f:
    json.dump(data, f, indent=2)