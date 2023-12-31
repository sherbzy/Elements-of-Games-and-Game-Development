{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_par_npc",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "NPC Objects",
    "path": "folders/Objects/NPC Objects.yy",
  },
  "parentObjectId": null,
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"loopRange01","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"30","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"loopRange02","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"240","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"myText","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"\"Why, hello there!\"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"myItem","filters":[
        "GMObject",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"noone","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"itemTextHappy","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"\"Text for the right item.\"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"itemTextSad","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"\"Text for the wrong item.\"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"itemTextDone","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"\"Thank you text.\"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"sequenceHappy","filters":[
        "GMSequence",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"noone","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"sequenceSad","filters":[
        "GMSequence",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"noone","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"myState","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"npcState.NORMAL","varType":4,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"doneSprite","filters":[
        "GMSprite",
      ],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"noone","varType":5,},
  ],
  "solid": false,
  "spriteId": null,
  "spriteMaskId": null,
  "visible": true,
}