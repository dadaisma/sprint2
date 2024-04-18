db.createCollection('subscriber', {validator: {$jsonSchema: {bsonType: 'object',title: 'subscriber',required: ['usuario'],properties:{usuario:{
  bsonType: 'array',items:{bsonType: 'objectId'}}}}}});