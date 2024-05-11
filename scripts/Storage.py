from pymongo import MongoClient

# Source MongoDB URI
source_uri = "mongodb://c1-ds4a-2-instructor:xecatHAb5Th3VuJu8wl5@20.232.135.212:27017/?authMechanism=DEFAULT"
# Target MongoDB Atlas URI
target_uri = "mongodb+srv://Nabeel:AustinData2002@healthratings.3yebzpj.mongodb.net/?retryWrites=true&w=majority&appName=Healthratings"

# Define batch size
batch_size = 1000  # Adjust this value according to your preference

try:
    # Connect to the source MongoDB database
    source_client = MongoClient(source_uri)

    # Connect to the target MongoDB Atlas database
    target_client = MongoClient(target_uri)

    # Access the source database
    source_db = source_client["healthrate"]

    # Access the source collection
    source_collection = source_db["ratemd"]

    # Access the target database
    target_db = target_client["HealthRatings"]

    # Access or create the target collection
    target_collection = target_db["Ratings"]

    # Get the total number of documents
    total_documents = source_collection.count_documents({})

    # Calculate the number of batches
    num_batches = (total_documents + batch_size - 1) // batch_size

    for batch_index in range(num_batches):
        # Fetch data in batches
        data_batch = list(source_collection.find().skip(batch_index * batch_size).limit(batch_size))

        if data_batch:
            # Insert the batch of data into the target collection
            target_collection.insert_many(data_batch)
            print(f"Batch {batch_index + 1}/{num_batches} successfully moved from source to target.")

    print("All data successfully moved from source to target.")

finally:
    # Close the connections
    source_client.close()
    target_client.close()
