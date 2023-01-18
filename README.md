To run `SideKiq` in <ins>3 processes</ins> you need:

```bash
docker-compose build
docker-compose up
```

Then go to http://0.0.0.0:9292/busy

Each `SideKiq` instance is connected to the same `Redis` instance, but handles different [queues](https://github.com/mersen1/sidekiq-without-rails/tree/main/app/config/sidekiq).  

<kbd><img width="831" alt="Screenshot 2023-01-18 at 12 02 30" src="https://user-images.githubusercontent.com/12909125/213155333-55c89fd9-8294-41ae-beee-3e7d64d3eb69.png"></kbd>
