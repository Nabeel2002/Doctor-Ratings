from pymongo import MongoClient
import csv

def transform_data(data):
  """
  Transforms a single data entry from MongoDB into the desired format.

  Args:
      data: A dictionary representing a single data entry from MongoDB.

  Returns:
      A list containing the doctor's full name, specialty, individual ratings,
      country, state, and city (or empty strings if missing).
  """
  # Extract relevant information with checks for missing or invalid keys

  full_name = data.get("full_name_specialty")
  specialty = data.get("specialty_name")

  # Access location information
  location = data.get("location", {})

  # Handle potential data inconsistencies (optional)
  city = ""
  country = ""
  state = ""
  average_rating = ""

  if isinstance(location, dict):
    try:
      city = location.get("city", {}).get("name", "")
      country = location.get("country_name", "")  # Check for missing key
      state = location.get("province_name", "")  # Check for missing key

      # Handle potential data inconsistency: ratings could be a string or None
      ratings = location.get("ratings")
      if isinstance(ratings, dict):
        average_rating = ratings.get("average", "")
      else:
        average_rating = ""  # Set default for missing ratings
    except AttributeError:
      city = ""  # Set city to empty string if nested access fails
  else:
    # Handle location as a string (unchanged)
    print(f"Unexpected location format: {location}")  # Log or handle the string value

  # Access rating information (assuming it's in the main data dictionary)
  ratings = data.get("rating", {})  # Use an empty dictionary if missing
  staff_rating = ratings.get("staff", "")
  punctuality_rating = ratings.get("punctuality", "")
  helpfulness_rating = ratings.get("helpfulness", "")
  knowledge_rating = ratings.get("knowledge", "")

  # Return data in desired format
  return [full_name, specialty, average_rating, staff_rating, punctuality_rating,
          helpfulness_rating, knowledge_rating, country, state, city]


def main():
  # Connect to MongoDB using the provided connection URI
  client = MongoClient("mongodb+srv://Nabeel:AustinData2002@healthratings.3yebzpj.mongodb.net/?retryWrites=true&w=majority")
  db = client["HealthRatings"]  # Access the "HealthRatings" database

  # Access the "Ratings" collection
  ratings_collection = db["Ratings"]

  # Open the output CSV file with desired encoding
  with open("transformed_data.csv", "w", encoding="utf-8", newline="") as outfile:
    writer = csv.writer(outfile)

    # Write header row
    writer.writerow(["Full Name", "Specialty", "Average Rating", "Staff Rating",
                     "Punctuality Rating", "Helpfulness Rating", "Knowledge Rating",
                     "Country", "State", "City"])

    # Transform and write each data entry
    for data in ratings_collection.find():  # Add colon after for loop
      transformed_row = transform_data(data)
      writer.writerow(transformed_row)

  # Close the connection to MongoDB
  client.close()

if __name__ == "__main__":
  main()
