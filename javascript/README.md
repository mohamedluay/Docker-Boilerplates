# Javascript
This boilerplate is designed to suite any javascript based project. (Both NodeJs or any frontend based project)

## Dockerfile

### Stage One (Base)

```
FROM node:10.15.2-alpine AS base

RUN apk add --update --no-cache \
    python \
    make \
    g++ 

# make the 'app' folder the current working directory
WORKDIR /app

COPY package*.json ./
```

In this stage, we prepare the basic configuration for the image. We install python, make, and g++ in order to execute the dependencies needed by Node Modules. We copy only the package.json and the package-lock.json file here so that we use it in the build stage. Keep in mind that build stage won't run unless you have those 2 files changed.

### Stage Two (Dependencies)
In this stage we will run ```npm install``` in order to install the dependencies to the container and save the installed dependencies in a temp directory so that we can use it in the last stage.

```
FROM base AS dev_dependencies
RUN npm install
RUN cp -R node_modules /tmp/dev_node_modules

FROM base AS prod_dependencies
RUN npm install --only=production 
RUN cp -R node_modules /tmp/prod_node_modules
```

### Stage Three - Optional (testing & linters)

### Stage Four (Final)
This stage is dedicated to copy the remaining files from the project, as well as copying the dependencies from its designated temp folder.
```
# ---- Dev ----
FROM base AS dev
# copy development node_modules
COPY --from=dev_dependencies /tmp/dev_node_modules ./node_modules
# copy app sources
COPY . .
# expose port and define CMD if any

# ---- Release ----
FROM base AS release
# copy production node_modules
COPY --from=prod_dependencies /tmp/prod_node_modules ./node_modules
# copy app sources
COPY . .
# expose port and define CMD if any
```

## docker-compose.yml
We are using a docker-compose file with version **'3.7'**, we are using three main services (dev, production and test), as well as a db service that we can use in dev and test to have a full contained environment. For production, use a remote instance and make sure to include its credential in the environment file commented. 

```
Quick Note 💡:
- We are not mounting any volumes in production since that we don't need code based files to be mirrored, however, you should re build the container each time you deploy either way.
- Uncomment the volumes section in db if you want to keep the data of the database. Keep in mind that this my lead to a permission issues when updating the db schema.
- If you are building for frontend project, you can add the build command in the command section inside the production service.
```