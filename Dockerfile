
# ---- Base Node ----
FROM node:10.15.2-alpine AS base

RUN apk add --update --no-cache \
    python \
    make \
    g++ 

# make the 'app' folder the current working directory
WORKDIR /app

COPY package*.json ./

# ---- Dependencies ----
FROM base AS dev_dependencies
RUN npm install
RUN cp -R node_modules /tmp/dev_node_modules

FROM base AS prod_dependencies
RUN npm install --only=production 
RUN cp -R node_modules /tmp/prod_node_modules

# ---- Test ----
# # run linters, setup and tests
# FROM dependencies AS test
# COPY . .
# RUN  npm run test

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


