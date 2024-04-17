db.createCollection('customer', {validator: {$jsonSchema: {bsonType: 'object',title: 'customer',required: ['name','telefono','email','fecha_registro','address','customer'],properties:{name:{bsonType: 'string'},surname:{bsonType: 'string'},telefono:{bsonType: 'string'},fecha_registro:{bsonType: 'timestamp'},address:{bsonType: 'objectId'},customer:{bsonType: 'objectId'}},patternProperties:{email:{bsonType: 'string',pattern:" /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)+$/"
}}}}});