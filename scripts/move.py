from pymongo import MongoClient

user = "c1-ds4a-2-instructor"
pwd =  "xecatHAb5Th3VuJu8wl5"
 
client = MongoClient(f"mongodb://{user}:{pwd}@20.232.135.212:27017/?authMechanism=DEFAULT")
 
# connect to the database
db = client['healthrate']
 
# print collection statistics
# events is the collection name here
print(db.command("collstats", "ratemd"))
# print database statistics
print(db.command("dbstats"))