db.createCollection('lens', {validator: {$jsonSchema: {bsonType: 'object',title: 'lens',required: ['graduacion_l','graduacion_r','colors'],properties:{graduacion_l:{bsonType: 'string'},graduacion_r:{bsonType: 'string'},colors:{bsonType: 'objectId'}}}}});