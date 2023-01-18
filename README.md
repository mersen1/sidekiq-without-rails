To run `SideKiq` in <ins>3 processes</ins> you need:

```bash
docker-compose build
docker-compose up
```

Then go to http://0.0.0.0:9292/busy

Each `SideKiq` instance is connected to the same `Redis` instance, but handles different [queues](https://github.com/mersen1/sidekiq-without-rails/tree/main/app/config/sidekiq).  
