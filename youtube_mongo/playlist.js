db.createCollection('playlist', {validator: {$jsonSchema: {bsonType: 'object',title: 'playlist',required: ['usuario','video'],properties:{name:{bsonType: 'string'},fecha_creracion:{bsonType: 'timestamp'},state:{enum: ["public","private"]},usuario:{bsonType: 'objectId'},video:{
  bsonType: 'array',items:{bsonType: 'objectId'}}}}}});