db.createCollection('opticaview', {validator: {$jsonSchema: {bsonType: 'object',title: 'opticaview',required: ['ventas','glasses'],properties:{ventas:{
  bsonType: 'array',items:{bsonType: 'objectId'}},glasses:{
  bsonType: 'array',items:{bsonType: 'objectId'}}}}}});