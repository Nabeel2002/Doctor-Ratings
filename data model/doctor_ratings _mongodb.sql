CREATE DATABASE 'INSTANCE'
 
use('INSTANCE');db.createCollection('dim_doctor',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "doctor_id"
  ],
  "properties": {
    "doctor_id": {
      "bsonType": "string"
    },
    "full_name": {
      "bsonType": "string"
    },
    "specialty_name": {
      "bsonType": "string"
    }
  }
} }});
 
use('INSTANCE');db.createCollection('dim_location',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "location_id"
  ],
  "properties": {
    "location.name": {
      "bsonType": "string"
    },
    "location.suite": {
      "bsonType": "string"
    },
    "location.latitude": {
      "bsonType": "double"
    },
    "location.address": {
      "bsonType": "string"
    },
    "location_id": {
      "bsonType": "string"
    },
    "location.postal_code": {
      "bsonType": "string"
    },
    "location.longitude": {
      "bsonType": "double"
    }
  }
} }});
 
use('INSTANCE');db.createCollection('dim_location_city',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "location_city_id"
  ],
  "properties": {
    "location.city.name": {
      "bsonType": "string"
    },
    "location.city.province_name": {
      "bsonType": "string"
    },
    "location_city_id": {
      "bsonType": "int"
    },
    "location.city.country_name": {
      "bsonType": "string"
    }
  }
} }});
 
use('INSTANCE');db.getCollection('dim_location_city').createIndex( { 'location_city_id':1 } , { name:'idx_dim_location_city_location_city_id'} );
 
use('INSTANCE');db.createCollection('dim_location_rating',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "location_rating_id"
  ],
  "properties": {
    "location_rating_id": {
      "bsonType": "int"
    }
  }
} }});
 
use('INSTANCE');db.getCollection('dim_location_rating').createIndex( { 'location_rating_id':1 } , { name:'idx_dim_location_rating_location_rating_id'} );
 
use('INSTANCE');db.createCollection('dim_rating',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "rating_id"
  ],
  "properties": {
    "rating_id": {
      "bsonType": "string"
    }
  }
} }});
 
use('INSTANCE');db.createCollection('fact_doctor_ratings',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "fact_id",
    "doctor_id",
    "location_id",
    "location_city_id",
    "rating_id",
    "location_rating_id"
  ],
  "properties": {
    "location_rating_id": {
      "bsonType": "int"
    },
    "fact_id": {
      "bsonType": "int"
    },
    "rating.helpfulness": {
      "bsonType": "double"
    },
    "location.rating.facilities": {
      "bsonType": "double"
    },
    "location_city_id": {
      "bsonType": "int"
    },
    "rating.staff": {
      "bsonType": "double"
    },
    "location.rating.cleanliness": {
      "bsonType": "double"
    },
    "location.rating.bestRating": {
      "bsonType": "double"
    },
    "location.rating.average": {
      "bsonType": "double"
    },
    "location.rating.value": {
      "bsonType": "double"
    },
    "rating.knowledge": {
      "bsonType": "double"
    },
    "location_id": {
      "bsonType": "int"
    },
    "rating.punctuality": {
      "bsonType": "double"
    },
    "rating.bestRating": {
      "bsonType": "double"
    },
    "doctor_id": {
      "bsonType": "int"
    },
    "rating_id": {
      "bsonType": "int"
    },
    "location.rating.services": {
      "bsonType": "double"
    },
    "rating.count": {
      "bsonType": "int"
    },
    "location.rating.count": {
      "bsonType": "int"
    }
  }
} }});
 
use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'location_id':1 } , { name:'idx_fact_doctor_ratings_location_id'} );
 
use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'doctor_id':1 } , { name:'idx_fact_doctor_ratings_doctor_id'} );
 
use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'rating_id':1 } , { name:'idx_fact_doctor_ratings_rating_id'} );
 
use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'location_rating_id':1 } , { name:'idx_fact_doctor_ratings_location_rating_id'} );
 
use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'location_city_id':1 } , { name:'idx_fact_doctor_ratings_location_city_id'} );
