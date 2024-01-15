from lib.db import get_posts, set_post_as_publicado
from lib.twitter import publicar_tweet

posts = get_posts()

for post in posts:
    publicar_tweet(post)
    set_post_as_publicado(post)
