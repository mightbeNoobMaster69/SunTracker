import json

#loads JSON file in data variable
with open('visual_processing/data/data.json') as f:
    data = json.load(f)

data['sunx'] = 90 #modifies the sun x pos in json "sunx"
data['suny'] = 90 #modifies the sun y pos in json "suny"
data['angle'] = 45 #modifies the angle in json "angle"

#writes out changes to the json file
with open('visual_processing/data/data.json', 'w') as f:
    json.dump(data, f, indent=2)