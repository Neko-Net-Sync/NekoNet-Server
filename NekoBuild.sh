docker build -f Docker/build/Dockerfile-MareSynchronosAuthService-git -t neko-auth .
docker build -f Docker/build/Dockerfile-MareSynchronosServer-git -t neko-server .
docker build -f Docker/build/Dockerfile-MareSynchronosServices-git -t neko-services .
docker build -f Docker/build/Dockerfile-MareSynchronosStaticFilesServer-git -t neko-static .