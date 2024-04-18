db.createCollection('video', {validator: {$jsonSchema: {bsonType: 'object',title: 'video',required: ['usuario','pais','like','dislike','post','tags'],properties:{title:{bsonType: 'string'},description:{bsonType: 'string'},size:{bsonType: 'double'},name_video_file:{bsonType: 'string'},duration:{bsonType: 'int'},thumbnail:{bsonType: 'string'},reproduciones:{bsonType: 'int'},usuario:{bsonType: 'objectId'},pais:{bsonType: 'objectId'},like:{
  bsonType: 'array',items:{bsonType: 'objectId'}},dislike:{
  bsonType: 'array',items:{bsonType: 'objectId'}},fecha_creacion:{bsonType: 'timestamp'},state:{enum: ["public","private","hidden"]},post:{
  bsonType: 'array',items:{bsonType: 'objectId'}},tags:{
  bsonType: 'array',items:{bsonType: 'objectId'}}}}}});