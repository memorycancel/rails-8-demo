docker build -t rails-8-demo .
docker tag memorycancel/rails-8-demo 192.168.0.100:5000/memorycancel/rails-8-demo
docker push 192.168.0.100:5000/memorycancel/rails-8-demo

docker build -t rails_solid .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name rails_solid rails_solid
docker tag rails_solid 192.168.0.100:5000/memorycancel/rails-8-demo/rails_solid
docker push 192.168.0.100:5000/memorycancel/rails-8-demo/rails_solid
