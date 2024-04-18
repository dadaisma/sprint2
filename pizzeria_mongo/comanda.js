db.createCollection('comanda', {validator: {$jsonSchema: {bsonType: 'object',title: 'comanda',required: ['customer','fecha_hora_comanda','tipo','total','producto','Pizzeria','employee'],properties:{customer:{bsonType: 'objectId'},fecha_hora_comanda:{bsonType: 'timestamp'},tipo:{enum: ["delivery","internal"]},nota:{bsonType: 'string'},total:{bsonType: 'double'},producto:{bsonType: 'objectId'},Pizzeria:{bsonType: 'objectId'},employee:{bsonType: 'objectId'},fecha_hora_entrega:{bsonType: 'timestamp'}}}}});