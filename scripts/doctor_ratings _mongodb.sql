CREATE DATABASE 'INSTANCE'

use('INSTANCE');db.createCollection('dim_doctor',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "doctor_id"
  ],
  "properties": {
    "doctor_id": {
      "bsonType": "VARCHAR"
    },
    "full_name": {
      "bsonType": "VARCHAR"
    },
    "specialty_name": {
      "bsonType": "VARCHAR"
    }
  }
} }});

use('INSTANCE');db.createCollection('dim_location',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "location_id"
  ],
  "properties": {
    "location_postal_code": {
      "bsonType": "VARCHAR"
    },
    "location_name": {
      "bsonType": "VARCHAR"
    },
    "location_city_name": {
      "bsonType": "VARCHAR"
    },
    "country_name": {
      "bsonType": "VARCHAR"
    },
    "location_id": {
      "bsonType": "VARCHAR"
    },
    "province_name": {
      "bsonType": "VARCHAR"
    }
  }
} }});

use('INSTANCE');db.createCollection('dim_location_rating',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "location_rating_id"
  ],
  "properties": {
    "location_rating_id": {
      "bsonType": "INT"
    },
    "cleanliness_rating": {
      "bsonType": "VARCHAR"
    },
    "services_rating": {
      "bsonType": "VARCHAR"
    },
    "best_rating": {
      "bsonType": "VARCHAR"
    },
    "average_rating": {
      "bsonType": "VARCHAR"
    },
    "facilities_rating": {
      "bsonType": "VARCHAR"
    },
    "rating_count": {
      "bsonType": "INT"
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
    "helpfulness_rating": {
      "bsonType": "VARCHAR"
    },
    "rating_id": {
      "bsonType": "VARCHAR"
    },
    "best_rating": {
      "bsonType": "VARCHAR"
    },
    "average_rating": {
      "bsonType": "VARCHAR"
    },
    "punctuality_rating": {
      "bsonType": "VARCHAR"
    },
    "knowledge_rating": {
      "bsonType": "VARCHAR"
    },
    "staff_rating": {
      "bsonType": "VARCHAR"
    },
    "rating_count": {
      "bsonType": "INT"
    }
  }
} }});

use('INSTANCE');db.createCollection('fact_doctor_ratings',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "fact_id",
    "doctor_id",
    "location_id",
    "rating_id",
    "location_rating_id"
  ],
  "properties": {
    "doctor_id": {
      "bsonType": "INT"
    },
    "location_rating_id": {
      "bsonType": "INT"
    },
    "fact_id": {
      "bsonType": "INT"
    },
    "rating_id": {
      "bsonType": "INT"
    },
    "location_id": {
      "bsonType": "INT"
    }
  }
} }});

use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'location_id':1 } , { name:'idx_fact_doctor_ratings_location_id'} );

use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'doctor_id':1 } , { name:'idx_fact_doctor_ratings_doctor_id'} );

use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'rating_id':1 } , { name:'idx_fact_doctor_ratings_rating_id'} );

use('INSTANCE');db.getCollection('fact_doctor_ratings').createIndex( { 'location_rating_id':1 } , { name:'idx_fact_doctor_ratings_location_rating_id'} );
