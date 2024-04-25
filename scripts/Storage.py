from pymongo import MongoClient

# Source MongoDB URI
source_uri = "mongodb://c1-ds4a-2-instructor:xecatHAb5Th3VuJu8wl5@20.232.135.212:27017/?authMechanism=DEFAULT"
# Target MongoDB Atlas URI
target_uri = "mongodb+srv://Nabeel:AustinData2002@healthratings.3yebzpj.mongodb.net/?retryWrites=true&w=majority&appName=Healthratings"

try:
    # Connect to the source MongoDB database
    source_client = MongoClient(source_uri)

    # Connect to the target MongoDB Atlas database
    target_client = MongoClient(target_uri)

    # Access the source database
    source_db = source_client["healthrate"]

    # Access the source collection
    source_collection = source_db["events"]

    # Access the target database
    target_db = target_client["HealthRatings"]

    # Access or create the target collection
    target_collection = target_db["Ratings"]

    # Fetch the data from the source collection
    data = list(source_collection.find())

    if data:
        # Insert the data into the target collection
        target_collection.insert_many(data)
        print("Data successfully moved from source to target.")
    else:
        print("No data found in the source collection.")

finally:
    # Close the connections
    source_client.close()
    target_client.close()
