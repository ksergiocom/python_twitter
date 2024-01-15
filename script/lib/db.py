import os

from bson import ObjectId
from pymongo import MongoClient

MONGO_URI=os.getenv('MONGO_URI')

client = MongoClient(MONGO_URI)
posts_collection = client['express_ksergiocom'].get_collection('posts')

def get_posts():
    posts = posts_collection.find({
        "$or": [
            {"publicadoTwitter": False},
            {"publicadoTwitter": {"$exists": False}}
        ]
    })

    return posts

def set_post_as_publicado(post):
    posts_collection.find_one_and_update({
        '_id': ObjectId(post['_id'])
    },{
      '$set':{
          'publicadoTwitter':True,
      }  
    })