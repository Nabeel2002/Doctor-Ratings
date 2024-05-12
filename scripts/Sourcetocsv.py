from pymongo import MongoClient
import csv

# Source MongoDB URI
source_uri = "mongodb://c1-ds4a-2-instructor:xecatHAb5Th3VuJu8wl5@20.232.135.212:27017/?authMechanism=DEFAULT"

# Define batch size
batch_size = 1000  # Adjust this value according to your preference

try:
    # Connect to the source MongoDB database
    source_client = MongoClient(source_uri)

    # Access the source database
    source_db = source_client["healthrate"]

    # Access the source collection
    source_collection = source_db["ratemd"]

    # Get the total number of documents
    total_documents = source_collection.count_documents({})

    # Calculate the number of batches
    num_batches = 10
    
    # Open a CSV file in write mode with UTF-8 encoding
    with open('health_ratings.csv', 'w', newline='', encoding='utf-8') as csvfile:
        # Extract fieldnames from the first document
        first_document = source_collection.find_one()
        fieldnames = list(first_document.keys()) if first_document else []

        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        
        # Write header if needed
        writer.writeheader()

        for batch_index in range(num_batches):
            # Fetch data in batches
            data_batch = list(source_collection.find().skip(batch_index * batch_size).limit(batch_size))

            if data_batch:
                # Write each document to the CSV file
                writer.writerows(data_batch)
                print(f"Batch {batch_index + 1}/{num_batches} successfully fetched and written to CSV.")

    print("Data successfully exported to CSV file.")

finally:
    # Close the connection
    source_client.close()
