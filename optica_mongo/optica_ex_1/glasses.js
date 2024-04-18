db.createCollection('glasses', {validator: {$jsonSchema: {bsonType: 'object',title: 'glasses',required: ['marca','tipo','precio','colors','lens'],properties:{marca:{bsonType: 'string'},tipo:{enum: "flotant", "pasta","metàllica"},precio:{bsonType: 'double'},colors:{bsonType: 'objectId'},lens:{bsonType: 'objectId'}}}}});