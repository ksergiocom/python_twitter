import os

import tweepy

client = tweepy.Client(
    consumer_key = os.getenv('CONSUMER_KEY'),
    consumer_secret = os.getenv('CONSUMER_SECRET'),
    access_token = os.getenv('ACCESS_TOKEN'),
    access_token_secret = os.getenv('ACCESS_TOKEN_SECRET'),
)

def publicar_tweet(post):

    if post['publicadoTwitter']:
        return

    texto = f"{post['titulo']}. Leer en: https://www.ksergio.com/{post['slug']}"

    client.create_tweet(text=texto)
