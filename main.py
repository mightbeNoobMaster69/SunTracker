import json
import math

#loads JSON file in data variable
with open('visual_processing/data/data.json') as f:
    data = json.load(f)

class Sensor:
    def __init__(self, posS):
        self.posS = posS # type of the sensor (left, middle or right position sensor)
        
        if(posS == 'left'):
            self.x = data['leftx']
            self.y = data['lefty']
        elif(posS == 'middle'):
            self.x = data['middlex']
            self.y = data['middley']
        else:
            self.x = data['rightx']
            self.y = data['righty']

        self.value = None
        self.prevValue = None

    def calcValue(self):
        sunx = data['sunx']
        suny = data['suny']
        
        if(self.posS == 'left'):
            self.x = data['leftx']
            self.y = data['lefty']
        elif(self.posS == 'middle'):
            self.x = data['middlex']
            self.y = data['middley']
        else:
            self.x = data['rightx']
            self.y = data['righty']

        self.value = math.sqrt( ((sunx - self.x)**2) + ((suny - self.y)**2) ) #use basic math to calculate the direct distance between the sensor and the sun

#create the sensor objects
leftSensor = Sensor('left')
middleSensor = Sensor('middle')
rightSensor = Sensor('right')

#calculate values for each one based on the position of the sun
def updateValues():
    leftSensor.calcValue() 
    middleSensor.calcValue()  
    rightSensor.calcValue()

def calcAngleRot(sensor, value):
    pass

updateValues()
if(leftSensor.value < middleSensor.value and leftSensor.value < rightSensor.value):
    calcAngleRot('l', leftSensor.value)
elif(middleSensor.value < leftSensor.value and middleSensor.value < rightSensor.value):
    calcAngleRot('m', middleSensor.value)
else:
    calcAngleRot('r', rightSensor.value)

#writes out changes to the json file
with open('visual_processing/data/data.json', 'w') as f:
    json.dump(data, f, indent=2)