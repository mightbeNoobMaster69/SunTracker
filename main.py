import json

#update the variable acordding to changes in the json file
with open('visual_processing/data/data.json') as f:
    data = json.load(f)

data['angle'] = 0 #modifies the data variable

#writes out changes to the json file
with open('visual_processing/data/data.json', 'w') as f:
    json.dump(data, f, indent=2)