# DOcker image build 

docker build -t mhrishad-app 
# Run Docker Container Locally

docker run -d -p 8080:80 mhrishad-app

# Run the application using Docker Compose:
docker-compose up -d


# Push to GitHub

git init
git add .
git commit -m "Dockerized Bootstrap App"


